import 'package:http/http.dart' as http;
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss1_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/util/datetime.dart';
import 'package:xml/xml.dart' as xml;

enum RssVersion {
  RSS1,
  RSS2,
  Atom,
  Unknown,
}

class WebFeed {
  WebFeed({
    this.title,
    this.description,
    this.links,
    this.items,
  });

  final String? title;
  final String? description;
  final List<String?>? links;
  final List<WebFeedItem>? items;

  static WebFeed? fromXmlString(String? xmlString) {
    if (xmlString == null) {
      return null;
    }
    final rssVersion = detectRssVersion(xmlString);
    switch (rssVersion) {
      case RssVersion.RSS1:
        final rss1Feed = Rss1Feed.parse(xmlString);
        return WebFeed.fromRss1(rss1Feed);
      case RssVersion.RSS2:
        final rss2Feed = RssFeed.parse(xmlString);
        return WebFeed.fromRss2(rss2Feed);
      case RssVersion.Atom:
        final atomFeed = AtomFeed.parse(xmlString);
        return WebFeed.fromAtom(atomFeed);
      case RssVersion.Unknown:
        throw Error.safeToString(
            'Invalid XML String? We cannot detect RSS/Atom version.');
      default:
        throw Exception('Some error has occured.');
    }
  }

  static WebFeed fromRss1(Rss1Feed rss1feed) {
    return WebFeed(
      title: rss1feed.title ?? rss1feed.dc?.title ?? '',
      description: rss1feed.description ?? rss1feed.dc?.description ?? '',
      links: [rss1feed.link],
      items: rss1feed.items
          ?.map(
            (item) => WebFeedItem(
              title: item.title ?? item.dc?.title ?? '',
              body: item.description ?? item.dc?.description ?? '',
              updated: item.dc?.date,
              links: [item.link],
            ),
          )
          .toList(),
    );
  }

  static WebFeed fromRss2(RssFeed rssFeed) {
    return WebFeed(
      title: rssFeed.title ?? rssFeed.dc?.title ?? '',
      description: rssFeed.description ?? rssFeed.dc?.description ?? '',
      links: [rssFeed.link],
      items: rssFeed.items
          ?.map(
            (item) => WebFeedItem(
              title: item.title ?? item.dc?.title ?? '',
              body: item.description ?? item.dc?.description ?? '',
              updated: item.pubDate ?? item.dc?.date,
              links: [item.link],
            ),
          )
          .toList(),
    );
  }

  static WebFeed fromAtom(AtomFeed atomFeed) {
    return WebFeed(
      title: atomFeed.title ?? '',
      description: atomFeed.subtitle ?? '',
      links: atomFeed.links?.map((atomLink) => atomLink.href).toList(),
      items: atomFeed.items
          ?.map(
            (item) => WebFeedItem(
              title: item.title ?? '',
              body: item.summary ?? item.content ?? '',
              updated: item.updated ?? parseDateTime(item.published),
              links: item.links?.map((atomLink) => atomLink.href).toList(),
            ),
          )
          .toList(),
    );
  }

  static Future<WebFeed?> fromUrl(String? url) async {
    if (url == null) {
      return null;
    }
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    return fromXmlString(response.body);
  }

  static RssVersion? detectRssVersion(String? xmlString) {
    if (xmlString == null) {
      return null;
    }
    final xmlDoc = xml.parse(xmlString);
    final rdfRefs = xmlDoc.findAllElements('rdf:RDF');
    final rssRefs = xmlDoc.findAllElements('rss');
    final feedRefs = xmlDoc.findAllElements('feed');

    if (rdfRefs.isNotEmpty) {
      return RssVersion.RSS1;
    } else if (rssRefs.isNotEmpty &&
        rssRefs.first.getAttribute('version')?.contains('2') == true) {
      return RssVersion.RSS2;
    } else if (feedRefs.isNotEmpty &&
        feedRefs.first.getAttribute('xmlns')?.toLowerCase().contains('atom') ==
            true) {
      return RssVersion.Atom;
    }
    return RssVersion.Unknown;
  }
}

class WebFeedItem {
  WebFeedItem({
    this.title,
    this.body,
    this.links,
    this.updated,
  });

  final String? title;
  final String? body;
  final List<String?>? links;
  final DateTime? updated;
}
