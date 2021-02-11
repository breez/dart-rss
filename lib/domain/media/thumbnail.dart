import 'package:xml/xml.dart';

class Thumbnail {
  final String? url;
  final String? width;
  final String? height;
  final String? time;

  Thumbnail({
    this.url,
    this.width,
    this.height,
    this.time,
  });

  static Thumbnail? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Thumbnail(
      url: element.getAttribute('url'),
      width: element.getAttribute('width'),
      height: element.getAttribute('height'),
      time: element.getAttribute('time'),
    );
  }
}
