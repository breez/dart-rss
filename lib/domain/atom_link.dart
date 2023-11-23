import 'package:xml/xml.dart';

class AtomLink {
  final String? href;
  final String? rel;
  final String? type;
  final String? hreflang;
  final String? title;
  final int length;

  AtomLink(
    this.href,
    this.rel,
    this.type,
    this.hreflang,
    this.title,
    this.length,
  );

  static AtomLink? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    var href = element.getAttribute('href');
    var rel = element.getAttribute('rel');
    var type = element.getAttribute('type');
    var title = element.getAttribute('title');
    var hreflang = element.getAttribute('hreflang');
    var length = 0;
    final lengthElement = element.getAttribute('length');
    if (lengthElement != null) {
      length = int.parse(lengthElement);
    }
    return AtomLink(href, rel, type, hreflang, title, length);
  }
}
