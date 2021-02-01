import 'package:webfeed/domain/podcast_index/rss_podcast_index_chapters.dart';
import 'package:webfeed/domain/podcast_index/rss_podcast_index_soudbite.dart';
import 'package:webfeed/domain/podcast_index/rss_podcast_index_transcript.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

class RssItemPodcastIndex {
  final RssPodcastIndexChapters? chapters;
  final List<RssPodcastIndexTranscript?>? transcripts;
  final List<RssPodcastIndexSoundbite?>? soundbites;

  RssItemPodcastIndex({
    this.chapters,
    this.transcripts,
    this.soundbites,
  });

  static RssItemPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssItemPodcastIndex(
      chapters: RssPodcastIndexChapters.parse(findElementOrNull(element, "podcast:chapters")),
      transcripts: element.findElements("podcast:transcript").map((e) {
        return RssPodcastIndexTranscript.parse(e);
      }).toList(),
      soundbites: element.findElements("podcast:soundbite").map((e) {
        return RssPodcastIndexSoundbite.parse(e);
      }).toList(),
    );
  }
}
