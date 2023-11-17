import 'dart:core';
import 'dart:io';

import 'package:test/test.dart';
import 'package:webfeed/domain/podcast_index/rss_podcast_index_value.dart';
import 'package:webfeed/webfeed.dart';

void main() {
  test('Recipients Real World Example', () {
    final feed = RssFeed.parse(
        File('test/xml/RSS-PodcastIndexValue.xml').readAsStringSync())!;

    expect(feed.title, 'Boostagram Ball');
    expect(feed.items!.length, 15);

    final episode14 = feed.items![0];
    expect(episode14.title, 'Boostagram Ball - Episode 14');

    final recipients = episode14.podcastIndex!.value!.recipients;
    expect(recipients.length, 5);

    final first = recipients[0];
    expect(first.name, 'Sovereign Feeds');
    expect(first.address,
        '030a58b8653d32b99200a2334cfe913e51dc7d155aa0116c176657a4f1722677a3');
    expect(first.type, 'node');
    expect(first.customKey, '696969');
    expect(first.customValue, 'eChoVKtO1KujpAA5HCoB');
    expect(first.fee, 'true');
    expect(first.split, '5');

    final second = recipients[1];
    expect(second.name, 'IPFSPodcating.net');
    expect(second.address,
        '028eb5be336f7fdf2a4e40c57ff55d3d5d71277bb4197ea14957f756bff249e623');
    expect(second.type, 'node');
    expect(second.split, '5');
    expect(second.fee, 'true');

    final third = recipients[2];
    expect(third.name, 'Boostagram Ball');
    expect(third.address,
        '021f548a8ab5eb8e7cf91e4c9777c388463e213485ece9a1808e3c6850084ee630');
    expect(third.type, 'node');
    expect(third.split, '94');

    final fourth = recipients[3];
    expect(fourth.name, 'Fountain Boost Bot');
    expect(fourth.address,
        '0332d57355d673e217238ce3e4be8491aa6b2a13f95494133ee243e57df1653ace');
    expect(fourth.type, 'node');
    expect(fourth.customKey, '112111100');
    expect(fourth.customValue, 'wal_GJWRnH1vp88Uf');
    expect(fourth.split, '1');

    final fifth = recipients[4];
    expect(fifth.name, 'reflex@getalby.com');
    expect(fifth.address,
        '030a58b8653d32b99200a2334cfe913e51dc7d155aa0116c176657a4f1722677a3');
    expect(fifth.type, 'node');
    expect(fifth.customKey, '696969');
    expect(fifth.customValue, 'x3VXZtbcfIBVLIUqzWKV');
    expect(fifth.split, '5');
  });

  test('Value Time Split Real World Example', () {
    final feed = RssFeed.parse(
        File('test/xml/RSS-PodcastIndexValue.xml').readAsStringSync())!;

    expect(feed.title, 'Boostagram Ball');
    expect(feed.items!.length, 15);

    final episode14 = feed.items![0];
    expect(episode14.title, 'Boostagram Ball - Episode 14');

    final timeSplit = episode14.podcastIndex!.value!.timeSplits;
    expect(timeSplit.length, 22);

    final expected = [
      RssPodcastIndexValueTimeSplit(
        startTime: 11.276,
        duration: 222.511,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "508bfb27-3623-513c-9eda-0b512a2abc82",
              itemGuid: "a0c6eb98-2bee-4d6b-add4-10ebd3fcb778",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 233.876,
        duration: 264.936,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "8ff88dea-8bc7-54d5-b350-41cc4dbdc212",
              itemGuid: "69e5fc94-e49e-4d5a-8fa3-fa4de462c19f",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 488.525,
        duration: 133.93,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "60e9fcee-0285-5ba9-870f-7e4c381ef846",
              itemGuid: "4554be73-db5e-40b1-aa1f-ff34fe39f1bf",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 621.926,
        duration: 193.097,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "9566a4fb-10a3-5b45-9e6c-bbb7db634dd1",
              itemGuid: "35411b62-649c-43ee-9e5d-82b81bc90d5d",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 940.375,
        duration: 242.965,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "2b62ef49-fcff-523c-b81a-0a7dde2b0609",
              itemGuid: "28b43b7e-2118-4835-add7-39abf048204e",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 1176.75,
        duration: 251.742,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "65af69db-7dcf-5c95-bf27-7526a6dbce35",
              itemGuid: "9aba1fe8-b050-43ad-ae56-7d37b66348a2",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 1512.425,
        duration: 294.864,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "a2d2e313-9cbd-5169-b89c-ab07b33ecc33",
              itemGuid: "d2346732-acc5-4256-afe5-0a0f3e670e6b",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 1798,
        duration: 180.558,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "a7dbd742-4aab-547a-ba3b-833e4d0c749a",
              itemGuid: "a1ff80f6-c601-4fe7-90d8-4bf85d2cc6ca",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 1979.826,
        duration: 160.92,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "69c634ad-afea-5826-ad9a-8e1f06d6470b",
              itemGuid: "45cb0eb4-baaa-4925-9de6-80dfa57205f4",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 2136.5,
        duration: 262.374,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "3a1102e4-f06f-53ee-a3d3-ca0636428f0e",
              itemGuid: "e76b50f9-2a3d-43e5-8403-932b7f7cae4c",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 2529.65,
        duration: 240.118,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "4a94646a-cfec-5d3d-b65c-ba576618c990",
              itemGuid: "5ae6f131-8cd2-4783-b40f-bc2068bae9a1",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 2761.476,
        duration: 158.851,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "bedfa09d-a354-4df4-a609-2a15ffb01eac",
              itemGuid: "71ba3f6e-734e-4332-8fc5-8aa1bf0f64e0",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 2918.875,
        duration: 198.478,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "48eea8c5-5610-527e-bd06-26b9332a0c8a",
              itemGuid: "ce3fb085-1387-47f3-a851-d7349125943d",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 3249.101,
        duration: 245.447,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "65cd72e4-fc7b-595d-baee-6c35feba420a",
              itemGuid: "d186993b-5230-43a2-aefb-418d79e03c6a",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 3481.153,
        duration: 198.528,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "2b62ef49-fcff-523c-b81a-0a7dde2b0609",
              itemGuid: "58c9b50a-6d5f-4dcd-90ae-e3a76a9d2c0e",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 3672.6,
        duration: 281.664,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "6f59f470-6287-56de-9cdc-3098fe3982d7",
              itemGuid: "d9376418-f32b-4897-9b26-d291eccb38d8",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 3948.025,
        duration: 315.638,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "aed4de9f-f070-56b1-9fb4-503059dafd07",
              itemGuid: "a826c111-1998-41a7-ab2f-83e6dd7c56f1",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 4260.6,
        duration: 181.499,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "2911ba9d-82e5-5a66-ac72-ead7c97e5013",
              itemGuid: "e08a8b67-6d65-4153-b244-112c984d289f",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 4435.601,
        duration: 75.651,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "a1b7a397-9e9a-5385-88bd-32257df977cc",
              itemGuid: "d19a438d-1bcb-4cc3-987a-4b44265f7d5f",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 4510.126,
        duration: 251.716,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "e88e5602-7105-5c7c-8b27-54513aac0ce8",
              itemGuid: "ccc1470c-ad85-4ae8-bf3a-10d7db63c402",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 4759.326,
        duration: 228.989,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "0c6704d4-52a2-54cb-8da3-3f6eccfb57be",
              itemGuid: "076e6d0d-81e1-42d1-a0af-4a98ebb2e494",
              medium: ""),
        ],
      ),
      RssPodcastIndexValueTimeSplit(
        startTime: 5039.026,
        duration: 213.812,
        remotePercentage: 90,
        remoteItems: [
          RssPodcastIndexRemoteItem(
              feedGuid: "6d9d2f51-63fe-5ab4-ab9a-259ea4612560",
              itemGuid: "23f74d0d-c600-4d51-af6e-cff207088820",
              medium: ""),
        ],
      ),
    ];
    for (var i = 0; i < 22; i++) {
      expect(timeSplit[i].startTime, expected[i].startTime);
      expect(timeSplit[i].duration, expected[i].duration);
      expect(timeSplit[i].remotePercentage, expected[i].remotePercentage);

      final expectedRemoteItem = expected[i].remoteItems[0];
      final remoteItem = timeSplit[i].remoteItems[0];
      expect(remoteItem.feedGuid, expectedRemoteItem.feedGuid);
      expect(remoteItem.itemGuid, expectedRemoteItem.itemGuid);
      expect(remoteItem.medium, expectedRemoteItem.medium);
    }
  });

  test('Remote Item Example From Documentation', () {
    final feed = RssFeed.parse(
        File('test/xml/RSS-PodcastIndexValue-ExampleRemoteItem.xml')
            .readAsStringSync())!;

    expect(feed.title, 'Metal Showcase');
    expect(feed.items!.length, 1);

    final episode = feed.items![0];
    expect(episode.title, 'Special interview with Torcon VII');

    final recipients = episode.podcastIndex!.value!.recipients;
    expect(recipients.length, 2);

    final first = recipients[0];
    expect(first.name, "Alice (Podcaster)");
    expect(first.address,
        "02d5c1bf8b940dc9cadca86d1b0a3c37fbe39cee4c7e839e33bef9174531d27f52");
    expect(first.type, "node");
    expect(first.split, "95");

    final second = recipients[1];
    expect(second.name, "Hosting Provider");
    expect(second.address,
        "03ae9f91a0cb8ff43840e3c322c4c61f019d8c1c3cea15a25cfc425ac605e61a4a");
    expect(second.type, "node");
    expect(second.fee, "true");
    expect(second.split, "5");

    final timeSplit = episode.podcastIndex!.value!.timeSplits;
    expect(timeSplit.length, 2);

    final firstTimeSplit = timeSplit[0];
    expect(firstTimeSplit.startTime, 60);
    expect(firstTimeSplit.duration, 237);
    expect(firstTimeSplit.remotePercentage, 95);
    expect(firstTimeSplit.remoteItems.length, 1);
    expect(firstTimeSplit.remoteItems[0].feedGuid,
        "a94f5cc9-8c58-55fc-91fe-a324087a655b");
    expect(firstTimeSplit.remoteItems[0].itemGuid,
        "https://podcastindex.org/podcast/4148683#1");
    expect(firstTimeSplit.remoteItems[0].medium, "music");

    final secondTimeSplit = timeSplit[1];
    expect(secondTimeSplit.startTime, 330);
    expect(secondTimeSplit.duration, 53);
    expect(secondTimeSplit.remotePercentage, 95);
    expect(secondTimeSplit.remoteItems.length, 1);
    expect(secondTimeSplit.remoteItems[0].feedGuid,
        "a94f5cc9-8c58-55fc-91fe-a324087a655b");
    expect(secondTimeSplit.remoteItems[0].itemGuid,
        "https://podcastindex.org/podcast/4148683#3");
    expect(secondTimeSplit.remoteItems[0].medium, "music");
  });

  test('Locally Specified Example From Documentation', () {
    final feed = RssFeed.parse(
        File('test/xml/RSS-PodcastIndexValue-ExampleLocallySpecified.xml')
            .readAsStringSync())!;

    expect(feed.title, 'Cool Pod');
    expect(feed.items!.length, 1);

    final episode = feed.items![0];
    expect(episode.title, 'Adam Hates the word "pod" (and I do, too)');

    final recipients = episode.podcastIndex!.value!.recipients;
    expect(recipients.length, 2);

    final first = recipients[0];
    expect(first.name, "Alice (Podcaster)");
    expect(first.address,
        "02d5c1bf8b940dc9cadca86d1b0a3c37fbe39cee4c7e839e33bef9174531d27f52");
    expect(first.type, "node");
    expect(first.split, "95");

    final second = recipients[1];
    expect(second.name, "Hosting Provider");
    expect(second.address,
        "03ae9f91a0cb8ff43840e3c322c4c61f019d8c1c3cea15a25cfc425ac605e61a4a");
    expect(second.type, "node");
    expect(second.fee, "true");
    expect(second.split, "5");

    final timeSplit = episode.podcastIndex!.value!.timeSplits;
    expect(timeSplit.length, 2);

    final firstTimeSplit = timeSplit[0];
    expect(firstTimeSplit.startTime, 63);
    expect(firstTimeSplit.duration, 388);
    expect(firstTimeSplit.valueRecipients.length, 2);
    expect(firstTimeSplit.valueRecipients[0].name, "Alice (Podcaster)");
    expect(firstTimeSplit.valueRecipients[0].address,
        "02d5c1bf8b940dc9cadca86d1b0a3c37fbe39cee4c7e839e33bef9174531d27f52");
    expect(firstTimeSplit.valueRecipients[0].type, "node");
    expect(firstTimeSplit.valueRecipients[0].split, "85");
    expect(firstTimeSplit.valueRecipients[1].name, "Jimbob (Guest)");
    expect(firstTimeSplit.valueRecipients[1].address,
        "02dd306e68c46681aa21d88a436fb35355a8579dd30201581cefa17cb179fc4c15");
    expect(firstTimeSplit.valueRecipients[1].type, "node");
    expect(firstTimeSplit.valueRecipients[1].split, "10");

    final secondTimeSplit = timeSplit[1];
    expect(secondTimeSplit.startTime, 367);
    expect(secondTimeSplit.duration, 246);
    expect(secondTimeSplit.valueRecipients.length, 2);
    expect(secondTimeSplit.valueRecipients[0].name, "Alice (Podcaster)");
    expect(secondTimeSplit.valueRecipients[0].address,
        "02d5c1bf8b940dc9cadca86d1b0a3c37fbe39cee4c7e839e33bef9174531d27f52");
    expect(secondTimeSplit.valueRecipients[0].type, "node");
    expect(secondTimeSplit.valueRecipients[0].split, "85");
    expect(secondTimeSplit.valueRecipients[1].name, "Bobjim (Guest)");
    expect(secondTimeSplit.valueRecipients[1].address,
        "032f4ffbbafffbe51726ad3c164a3d0d37ec27bc67b29a159b0f49ae8ac21b8508");
    expect(secondTimeSplit.valueRecipients[1].type, "node");
    expect(secondTimeSplit.valueRecipients[1].split, "10");
  });
}
