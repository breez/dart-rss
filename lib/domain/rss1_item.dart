import 'package:webfeed/domain/rss_content.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

import 'dublin_core/dublin_core.dart';

class Rss1Item {
  final String title;
  final String description;
  final String link;
  final List<String> subjects;
  final String creator;
  final DateTime date;
  final DublinCore dc;
  final RssContent content;

  Rss1Item({
    this.title,
    this.description,
    this.link,
    this.subjects,
    this.creator,
    this.date,
    this.dc,
    this.content,
  });

  static DateTime _dateTimeBuilder(String dateTimeStringOrNull) {
    if (dateTimeStringOrNull == null) {
      return null;
    }
    return DateTime.parse(dateTimeStringOrNull);
  }

  factory Rss1Item.parse(XmlElement element) {
    return Rss1Item(
      title: findElementOrNull(element, "title")?.text,
      description: findElementOrNull(element, "description")?.text,
      link: findElementOrNull(element, "link")?.text,
      subjects: element
          .findAllElements('dc:subject')
          .map((subject) => subject.text)
          .toList(),
      creator: findElementOrNull(element, 'dc:creator')?.text,
      date: _dateTimeBuilder(findElementOrNull(element, 'dc:date')?.text),
      dc: DublinCore.parse(element),
      content: RssContent.parse(findElementOrNull(element, "content:encoded")),
    );
  }
}
