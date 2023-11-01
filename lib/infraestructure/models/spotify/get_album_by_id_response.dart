class AlbumByIdResponse {
  final String albumType;
  final List<AlbumArtist> artists;
  final List<String> availableMarkets;
  final List<Copyright> copyrights;
  final AlbumExternalIds externalIds;
  final AlbumExternalUrls externalUrls;
  final List<dynamic> genres;
  final String href;
  final String id;
  final List<AlbumImage> images;
  final String label;
  final String name;
  final int popularity;
  final DateTime releaseDate;
  final String releaseDatePrecision;
  final int totalTracks;
  final AlbumTracks tracks;
  final String type;
  final String uri;

  AlbumByIdResponse({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.copyrights,
    required this.externalIds,
    required this.externalUrls,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.label,
    required this.name,
    required this.popularity,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  factory AlbumByIdResponse.fromJson(Map<String, dynamic> json) =>
      AlbumByIdResponse(
        albumType: json["album_type"] ?? '',
        artists: List<AlbumArtist>.from(
            json["artists"].map((x) => AlbumArtist.fromJson(x))),
        availableMarkets:
            List<String>.from(json["available_markets"].map((x) => x)),
        copyrights: List<Copyright>.from(
            json["copyrights"].map((x) => Copyright.fromJson(x))),
        externalIds: AlbumExternalIds.fromJson(json["external_ids"]),
        externalUrls: AlbumExternalUrls.fromJson(json["external_urls"]),
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        href: json["href"] ?? '',
        id: json["id"] ?? '',
        images: List<AlbumImage>.from(
            json["images"].map((x) => AlbumImage.fromJson(x))),
        label: json["label"] ?? '',
        name: json["name"] ?? '',
        popularity: json["popularity"] ?? 0,
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"] ?? '',
        totalTracks: json["total_tracks"] ?? 0,
        tracks: AlbumTracks.fromJson(json["tracks"]),
        type: json["type"] ?? '',
        uri: json["uri"] ?? '',
      );
}

class AlbumArtist {
  final AlbumExternalUrls externalUrls;
  final String href;
  final String id;
  final String name;
  final AlbumArtistType type;
  final String uri;

  AlbumArtist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory AlbumArtist.fromJson(Map<String, dynamic> json) => AlbumArtist(
        externalUrls: AlbumExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] ?? '',
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        type: artistTypeValues.map[json["type"]]!,
        uri: json["uri"] ?? '',
      );
}

class AlbumExternalUrls {
  final String spotify;

  AlbumExternalUrls({
    required this.spotify,
  });

  factory AlbumExternalUrls.fromJson(Map<String, dynamic> json) =>
      AlbumExternalUrls(
        spotify: json["spotify"] ?? '',
      );
}

enum AlbumArtistType { artist }

final artistTypeValues = EnumValues({"artist": AlbumArtistType.artist});

class Copyright {
  final String text;
  final String type;

  Copyright({
    required this.text,
    required this.type,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"] ?? '',
        type: json["type"] ?? '',
      );
}

class AlbumExternalIds {
  final String upc;

  AlbumExternalIds({
    required this.upc,
  });

  factory AlbumExternalIds.fromJson(Map<String, dynamic> json) =>
      AlbumExternalIds(
        upc: json["upc"] ?? '',
      );
}

class AlbumImage {
  final int height;
  final String url;
  final int width;

  AlbumImage({
    required this.height,
    required this.url,
    required this.width,
  });

  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );
}

class AlbumTracks {
  final String href;
  final List<AlbumItem> items;
  final int limit;
  final dynamic next;
  final int offset;
  final dynamic previous;
  final int total;

  AlbumTracks({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory AlbumTracks.fromJson(Map<String, dynamic> json) => AlbumTracks(
        href: json["href"] ?? '',
        items: List<AlbumItem>.from(
            json["items"].map((x) => AlbumItem.fromJson(x))),
        limit: json["limit"] ?? 0,
        next: json["next"] ?? '',
        offset: json["offset"] ?? 0,
        previous: json["previous"] ?? '',
        total: json["total"] ?? 0,
      );
}

class AlbumItem {
  final List<AlbumArtist> artists;
  final List<String> availableMarkets;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final AlbumExternalUrls externalUrls;
  final String href;
  final String id;
  final bool isLocal;
  final String name;
  final String previewUrl;
  final int trackNumber;
  final AlbumItemType type;
  final String uri;

  AlbumItem({
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.name,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory AlbumItem.fromJson(Map<String, dynamic> json) => AlbumItem(
        artists: List<AlbumArtist>.from(
            json["artists"].map((x) => AlbumArtist.fromJson(x))),
        availableMarkets:
            List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"] ?? 0,
        durationMs: json["duration_ms"] ?? 0,
        explicit: json["explicit"] ?? false,
        externalUrls: AlbumExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] ?? '',
        id: json["id"] ?? '',
        isLocal: json["is_local"] ?? false,
        name: json["name"] ?? '',
        previewUrl: json["preview_url"] ?? '',
        trackNumber: json["track_number"] ?? 0,
        type: itemTypeValues.map[json["type"]]!,
        uri: json["uri"] ?? '',
      );
}

enum AlbumItemType { track }

final itemTypeValues = EnumValues({"track": AlbumItemType.track});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
