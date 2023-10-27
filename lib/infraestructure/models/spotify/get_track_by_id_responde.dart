class TrackByIdResponse {
    final TrackAlbum album;
    final List<TrackArtist> artists;
    final List<dynamic> availableMarkets;
    final int discNumber;
    final int durationMs;
    final bool explicit;
    final TrackExternalIds externalIds;
    final TrackExternalUrls externalUrls;
    final String href;
    final String id;
    final bool isLocal;
    final String name;
    final int popularity;
    final dynamic previewUrl;
    final int trackNumber;
    final String type;
    final String uri;

    TrackByIdResponse({
        required this.album,
        required this.artists,
        required this.availableMarkets,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalIds,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.name,
        required this.popularity,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
    });

    factory TrackByIdResponse.fromJson(Map<String, dynamic> json) => TrackByIdResponse(
        album: TrackAlbum.fromJson(json["album"]),
        artists: List<TrackArtist>.from(json["artists"].map((x) => TrackArtist.fromJson(x))),
        availableMarkets: List<dynamic>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: TrackExternalIds.fromJson(json["external_ids"]),
        externalUrls: TrackExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
    };
}

class TrackAlbum {
    final String albumType;
    final List<TrackArtist> artists;
    final List<dynamic> availableMarkets;
    final TrackExternalUrls externalUrls;
    final String href;
    final String id;
    final List<TrackImage> images;
    final String name;
    final DateTime releaseDate;
    final String releaseDatePrecision;
    final int totalTracks;
    final String type;
    final String uri;

    TrackAlbum({
        required this.albumType,
        required this.artists,
        required this.availableMarkets,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.type,
        required this.uri,
    });

    factory TrackAlbum.fromJson(Map<String, dynamic> json) => TrackAlbum(
        albumType: json["album_type"],
        artists: List<TrackArtist>.from(json["artists"].map((x) => TrackArtist.fromJson(x))),
        availableMarkets: List<dynamic>.from(json["available_markets"].map((x) => x)),
        externalUrls: TrackExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<TrackImage>.from(json["images"].map((x) => TrackImage.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
    };
}

class TrackArtist {
    final TrackExternalUrls externalUrls;
    final String href;
    final String id;
    final String name;
    final String type;
    final String uri;

    TrackArtist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    factory TrackArtist.fromJson(Map<String, dynamic> json) => TrackArtist(
        externalUrls: TrackExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
    };
}

class TrackExternalUrls {
    final String spotify;

    TrackExternalUrls({
        required this.spotify,
    });

    factory TrackExternalUrls.fromJson(Map<String, dynamic> json) => TrackExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class TrackImage {
    final int height;
    final String url;
    final int width;

    TrackImage({
        required this.height,
        required this.url,
        required this.width,
    });

    factory TrackImage.fromJson(Map<String, dynamic> json) => TrackImage(
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

class TrackExternalIds {
    final String isrc;

    TrackExternalIds({
        required this.isrc,
    });

    factory TrackExternalIds.fromJson(Map<String, dynamic> json) => TrackExternalIds(
        isrc: json["isrc"],
    );

    Map<String, dynamic> toJson() => {
        "isrc": isrc,
    };
}
