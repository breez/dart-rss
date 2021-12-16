import 'dart:core';

import 'package:xml/xml.dart';

XmlElement? findElementOrNull(
  XmlElement? element,
  String? name, {
  String? namespace,
}) {
  if (element == null) return null;
  if (name == null) return null;
  try {
    return element.findAllElements(name, namespace: namespace).first;
  } on StateError {
    return null;
  }
}

XmlElement? findDirectElementOrNull(XmlElement element, String name,
    {String? namespace}) {
  try {
    return element.findElements(name, namespace: namespace).first;
  } on StateError {
    return null;
  }
}

List<XmlElement>? findAllDirectElementsOrNull(
  XmlElement? element,
  String? name, {
  String? namespace,
}) {
  if (element == null) return null;
  if (name == null) return null;
  try {
    return element.findElements(name, namespace: namespace).toList();
  } on StateError {
    return null;
  }
}

bool? parseBoolLiteral(XmlElement? element, String? tagName) {
  if (element == null) return null;
  if (tagName == null) return null;
  var v = findElementOrNull(element, tagName)?.text.toLowerCase().trim();
  if (v == null) return null;
  return ["yes", "true"].contains(v);
}

int? parseInt(String? intString) {
  if (intString == null) return null;
  return int.parse(intString);
}
