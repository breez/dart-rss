import 'package:webfeed/domain/atom_category.dart';
import 'package:webfeed/domain/atom_generator.dart';
import 'package:webfeed/domain/atom_item.dart';
import 'package:webfeed/domain/atom_link.dart';
import 'package:webfeed/domain/atom_person.dart';
import 'package:webfeed/util/datetime.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class AtomFeed {
  final String? id;
  final String? title;
  final DateTime? updated;
  final List<AtomItem>? items;

  final List<AtomLink>? links;
  final List<AtomPerson>? authors;
  final List<AtomPerson>? contributors;
  final List<AtomCategory>? categories;
  final AtomGenerator? generator;
  final String? icon;
  final String? logo;
  final String? rights;
  final String? subtitle;

  AtomFeed({
    this.id,
    this.title,
    this.updated,
    this.items,
    this.links,
    this.authors,
    this.contributors,
    this.categories,
    this.generator,
    this.icon,
    this.logo,
    this.rights,
    this.subtitle,
  });

  static AtomFeed? parse(String? xmlString) {
    if (xmlString == null) {
      return null;
    }
    var document = XmlDocument.parse(xmlString);
    var feedElement = document.findElements('feed').firstOrNull;
    if (feedElement == null) {
      throw ArgumentError('feed not found');
    }

    return AtomFeed(
      id: feedElement.findElements('id').firstOrNull?.text,
      title: feedElement.findElements('title').firstOrNull?.text,
      updated:
          parseDateTime(feedElement.findElements('updated').firstOrNull?.text),
      items: feedElement
          .findElements('entry')
          .map((e) => AtomItem.parse(e))
          .whereType<AtomItem>()
          .toList(),
      links: feedElement
          .findElements('link')
          .map((e) => AtomLink.parse(e))
          .whereType<AtomLink>()
          .toList(),
      authors: feedElement
          .findElements('author')
          .map((e) => AtomPerson.parse(e))
          .whereType<AtomPerson>()
          .toList(),
      contributors: feedElement
          .findElements('contributor')
          .map((e) => AtomPerson.parse(e))
          .whereType<AtomPerson>()
          .toList(),
      categories: feedElement
          .findElements('category')
          .map((e) => AtomCategory.parse(e))
          .whereType<AtomCategory>()
          .toList(),
      generator: feedElement
          .findElements('generator')
          .map((e) => AtomGenerator.parse(e))
          .firstOrNull,
      icon: feedElement.findElements('icon').firstOrNull?.text,
      logo: feedElement.findElements('logo').firstOrNull?.text,
      rights: feedElement.findElements('rights').firstOrNull?.text,
      subtitle: feedElement.findElements('subtitle').firstOrNull?.text,
    );
  }
}
