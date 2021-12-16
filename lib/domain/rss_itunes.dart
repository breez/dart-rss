import 'package:webfeed/domain/rss_itunes_category.dart';
import 'package:webfeed/domain/rss_itunes_image.dart';
import 'package:webfeed/domain/rss_itunes_owner.dart';
import 'package:webfeed/domain/rss_itunes_type.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

class RssItunes {
  final String? author;
  final String? summary;
  final bool? explicit;
  final String? title;
  final String? subtitle;
  final RssItunesOwner? owner;
  final List<String>? keywords;
  final RssItunesImage? image;
  final List<RssItunesCategory>? categories;
  final RssItunesType? type;
  final String? newFeedUrl;
  final bool? block;
  final bool? complete;

  RssItunes({
    this.author,
    this.summary,
    this.explicit,
    this.title,
    this.subtitle,
    this.owner,
    this.keywords,
    this.image,
    this.categories,
    this.type,
    this.newFeedUrl,
    this.block,
    this.complete,
  });

  static RssItunes? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    final categories = findAllDirectElementsOrNull(element, "itunes:category");
    return RssItunes(
      author: findElementOrNull(element, "itunes:author")?.text.trim(),
      summary: findElementOrNull(element, "itunes:summary")?.text.trim(),
      explicit: parseBoolLiteral(element, "itunes:explicit"),
      title: findElementOrNull(element, "itunes:title")?.text.trim(),
      subtitle: findElementOrNull(element, "itunes:subtitle")?.text.trim(),
      owner: RssItunesOwner.parse(findElementOrNull(element, "itunes:owner")),
      keywords: findElementOrNull(element, "itunes:keywords")
          ?.text
          .split(",")
          .map((keyword) => keyword.trim())
          .toList(),
      image: RssItunesImage.parse(findElementOrNull(element, "itunes:image")),
      categories: categories == null ? null : categories
          .map((ele) => RssItunesCategory.parse(ele))
          .whereType<RssItunesCategory>()
          .toList(),
      type: newRssItunesType(findElementOrNull(element, "itunes:type")),
      newFeedUrl:
          findElementOrNull(element, "itunes:new-feed-url")?.text.trim(),
      block: parseBoolLiteral(element, "itunes:block"),
      complete: parseBoolLiteral(element, "itunes:complete"),
    );
  }
}
