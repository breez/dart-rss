import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class AtomPerson {
  final String? name;
  final String? uri;
  final String? email;

  AtomPerson({this.name, this.uri, this.email});

  static AtomPerson? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return AtomPerson(
      name: element.findElements('name').firstOrNull?.text,
      uri: element.findElements('uri').firstOrNull?.text,
      email: element.findElements('email').firstOrNull?.text,
    );
  }
}
