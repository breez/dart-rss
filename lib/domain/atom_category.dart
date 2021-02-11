import 'package:xml/xml.dart';

class AtomCategory {
  final String? term;
  final String? scheme;
  final String? label;

  AtomCategory(this.term, this.scheme, this.label);

  static AtomCategory? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    var term = element.getAttribute('term');
    var scheme = element.getAttribute('scheme');
    var label = element.getAttribute('label');
    return AtomCategory(term, scheme, label);
  }
}
