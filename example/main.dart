import 'dart:io';

import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

void main() async {
  final client = IOClient(HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true));

  // RSS feed
  client
      .get(Uri.parse('https://developer.apple.com/news/releases/rss/releases.rss'))
      .then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = RssFeed.parse(bodyString);
    print(channel);
    return channel;
  });

  // Atom feed
  client.get(Uri.parse('https://www.theverge.com/rss/index.xml')).then((response) {
    return response.body;
  }).then((bodyString) {
    var feed = AtomFeed.parse(bodyString);
    print(feed);
    return feed;
  });
}
