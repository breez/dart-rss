import 'package:xml/xml.dart';

class RssPodcastIndexValue {
  final String? type;
  final String? method;
  final String? suggested;
  final List<RssPodcastIndexValueRecipient> recipients;
  final List<RssPodcastIndexValueTimeSplit> timeSplits;

  const RssPodcastIndexValue({
    this.type,
    this.method,
    this.suggested,
    this.recipients = const <RssPodcastIndexValueRecipient>[],
    this.timeSplits = const <RssPodcastIndexValueTimeSplit>[],
  });

  static RssPodcastIndexValue? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexValue(
      type: element.getAttribute('type'),
      method: element.getAttribute('method'),
      suggested: element.getAttribute('suggested'),
      recipients: RssPodcastIndexValueRecipient.parseList(element) ?? [],
      timeSplits: RssPodcastIndexValueTimeSplit.parseList(element) ?? [],
    );
  }
}

class RssPodcastIndexValueRecipient {
  final String? name;
  final String? type;
  final String? address;
  final String? customKey;
  final String? customValue;
  final String? split;
  final String? fee;

  const RssPodcastIndexValueRecipient({
    this.name,
    this.type,
    this.address,
    this.customKey,
    this.customValue,
    this.split,
    this.fee,
  });

  static RssPodcastIndexValueRecipient? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexValueRecipient(
      name: element.getAttribute('name'),
      type: element.getAttribute('type'),
      address: element.getAttribute('address'),
      customKey: element.getAttribute('customKey'),
      customValue: element.getAttribute('customValue'),
      split: element.getAttribute('split'),
      fee: element.getAttribute('fee'),
    );
  }

  static List<RssPodcastIndexValueRecipient>? parseList(XmlElement? element) {
    if (element == null) return null;
    return element
        .findElements('podcast:valueRecipient')
        .map((element) => RssPodcastIndexValueRecipient.parse(element))
        .whereType<RssPodcastIndexValueRecipient>()
        .toList();
  }
}

class RssPodcastIndexValueTimeSplit {
  final double startTime;
  final double duration;
  final int remoteStartTime;
  final int remotePercentage;
  final List<RssPodcastIndexValueRecipient> valueRecipients;
  final List<RssPodcastIndexRemoteItem> remoteItems;

  const RssPodcastIndexValueTimeSplit({
    required this.startTime,
    required this.duration,
    this.remoteStartTime = 0,
    this.remotePercentage = 100,
    this.valueRecipients = const <RssPodcastIndexValueRecipient>[],
    this.remoteItems = const <RssPodcastIndexRemoteItem>[],
  });

  static RssPodcastIndexValueTimeSplit? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexValueTimeSplit(
      startTime: double.tryParse(element.getAttribute('startTime') ?? '') ?? 0,
      duration: double.tryParse(element.getAttribute('duration') ?? '') ?? 0,
      remoteStartTime:
          int.tryParse(element.getAttribute('remoteStartTime') ?? '') ?? 0,
      remotePercentage:
          int.tryParse(element.getAttribute('remotePercentage') ?? '') ?? 100,
      valueRecipients: RssPodcastIndexValueRecipient.parseList(element) ?? [],
      remoteItems: RssPodcastIndexRemoteItem.parseList(element) ?? [],
    );
  }

  static List<RssPodcastIndexValueTimeSplit>? parseList(XmlElement? element) {
    if (element == null) return null;
    return element
        .findElements('podcast:valueTimeSplit')
        .map((element) => RssPodcastIndexValueTimeSplit.parse(element))
        .whereType<RssPodcastIndexValueTimeSplit>()
        .toList();
  }
}

class RssPodcastIndexRemoteItem {
  final String itemGuid;
  final String feedGuid;
  final String medium;

  const RssPodcastIndexRemoteItem({
    required this.itemGuid,
    required this.feedGuid,
    required this.medium,
  });

  static RssPodcastIndexRemoteItem? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexRemoteItem(
      itemGuid: element.getAttribute('itemGuid') ?? '',
      feedGuid: element.getAttribute('feedGuid') ?? '',
      medium: element.getAttribute('medium') ?? '',
    );
  }

  static List<RssPodcastIndexRemoteItem>? parseList(XmlElement? element) {
    if (element == null) return null;
    return element
        .findElements('podcast:remoteItem')
        .map((element) => RssPodcastIndexRemoteItem.parse(element))
        .whereType<RssPodcastIndexRemoteItem>()
        .toList();
  }
}
