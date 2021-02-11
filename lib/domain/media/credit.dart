import 'package:xml/xml.dart';

class Credit {
  final String? role;
  final String? scheme;
  final String? value;

  Credit({
    this.role,
    this.scheme,
    this.value,
  });

  static Credit? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Credit(
      role: element.getAttribute('role'),
      scheme: element.getAttribute('scheme'),
      value: element.text,
    );
  }
}
