import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class RssImage {
  final String? title;
  final String? url;
  final String? link;

  RssImage({this.title, this.url, this.link});

  static RssImage? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return RssImage(
      title: element.findElements('title').firstOrNull?.text,
      url: element.findElements('url').firstOrNull?.text,
      link: element.findElements('link').firstOrNull?.text,
    );
  }
}
