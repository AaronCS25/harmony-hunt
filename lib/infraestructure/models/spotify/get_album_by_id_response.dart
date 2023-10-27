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

    factory AlbumByIdResponse.fromJson(Map<String, dynamic> json) => AlbumByIdResponse(
        albumType: json["album_type"],
        artists: List<AlbumArtist>.from(json["artists"].map((x) => AlbumArtist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        copyrights: List<Copyright>.from(json["copyrights"].map((x) => Copyright.fromJson(x))),
        externalIds: AlbumExternalIds.fromJson(json["external_ids"]),
        externalUrls: AlbumExternalUrls.fromJson(json["external_urls"]),
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<AlbumImage>.from(json["images"].map((x) => AlbumImage.fromJson(x))),
        label: json["label"],
        name: json["name"],
        popularity: json["popularity"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        tracks: AlbumTracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "copyrights": List<dynamic>.from(copyrights.map((x) => x.toJson())),
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "label": label,
        "name": name,
        "popularity": popularity,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "tracks": tracks.toJson(),
        "type": type,
        "uri": uri,
    };
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
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: artistTypeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": artistTypeValues.reverse[type],
        "uri": uri,
    };
}

class AlbumExternalUrls {
    final String spotify;

    AlbumExternalUrls({
        required this.spotify,
    });

    factory AlbumExternalUrls.fromJson(Map<String, dynamic> json) => AlbumExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

enum AlbumArtistType {
    ARTIST
}

final artistTypeValues = EnumValues({
    "artist": AlbumArtistType.ARTIST
});

class Copyright {
    final String text;
    final String type;

    Copyright({
        required this.text,
        required this.type,
    });

    factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
    };
}

class AlbumExternalIds {
    final String upc;

    AlbumExternalIds({
        required this.upc,
    });

    factory AlbumExternalIds.fromJson(Map<String, dynamic> json) => AlbumExternalIds(
        upc: json["upc"],
    );

    Map<String, dynamic> toJson() => {
        "upc": upc,
    };
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

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
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
        href: json["href"],
        items: List<AlbumItem>.from(json["items"].map((x) => AlbumItem.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
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
        artists: List<AlbumArtist>.from(json["artists"].map((x) => AlbumArtist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: AlbumExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: itemTypeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": itemTypeValues.reverse[type],
        "uri": uri,
    };
}

enum AlbumItemType {
    TRACK
}

final itemTypeValues = EnumValues({
    "track": AlbumItemType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
