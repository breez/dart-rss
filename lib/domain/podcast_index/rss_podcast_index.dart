import 'package:webfeed/domain/podcast_index/rss_podcast_index_funding.dart';
import 'package:webfeed/domain/podcast_index/rss_podcast_index_locked.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

class RssPodcastIndex {
  final RssPodcastIndexFunding? funding;
  final RssPodcastIndexLocked? locked;

  RssPodcastIndex({
    this.funding,
    this.locked,
  });

  static RssPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return RssPodcastIndex(
      funding: RssPodcastIndexFunding.parse(findElementOrNull(element, "podcast:funding")),
      locked: RssPodcastIndexLocked.parse(findElementOrNull(element, "podcast:locked")),
    );
  }
}
