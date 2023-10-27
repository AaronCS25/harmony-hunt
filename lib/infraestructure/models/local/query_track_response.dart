class QueryTrackResponse {
    final String trackId;
    final String trackName;
    final String trackArtist;
    final String lyrics;
    final int trackPopularity;
    final String trackAlbumId;
    final String trackAlbumName;
    final DateTime trackAlbumReleaseDate;
    final String playlistName;
    final String playlistId;
    final String playlistGenre;
    final String playlistSubgenre;
    final double danceability;
    final double energy;
    final int key;
    final double loudness;
    final int mode;
    final double speechiness;
    final double acousticness;
    final double instrumentalness;
    final double liveness;
    final double valence;
    final int tempo;
    final int durationMs;
    final String language;

    QueryTrackResponse({
        required this.trackId,
        required this.trackName,
        required this.trackArtist,
        required this.lyrics,
        required this.trackPopularity,
        required this.trackAlbumId,
        required this.trackAlbumName,
        required this.trackAlbumReleaseDate,
        required this.playlistName,
        required this.playlistId,
        required this.playlistGenre,
        required this.playlistSubgenre,
        required this.danceability,
        required this.energy,
        required this.key,
        required this.loudness,
        required this.mode,
        required this.speechiness,
        required this.acousticness,
        required this.instrumentalness,
        required this.liveness,
        required this.valence,
        required this.tempo,
        required this.durationMs,
        required this.language,
    });

    factory QueryTrackResponse.fromJson(Map<String, dynamic> json) => QueryTrackResponse(
        trackId: json["track_id"],
        trackName: json["track_name"],
        trackArtist: json["track_artist"],
        lyrics: json["lyrics"],
        trackPopularity: json["track_popularity"],
        trackAlbumId: json["track_album_id"],
        trackAlbumName: json["track_album_name"],
        trackAlbumReleaseDate: DateTime.parse(json["track_album_release_date"]),
        playlistName: json["playlist_name"],
        playlistId: json["playlist_id"],
        playlistGenre: json["playlist_genre"],
        playlistSubgenre: json["playlist_subgenre"],
        danceability: json["danceability"]?.toDouble(),
        energy: json["energy"]?.toDouble(),
        key: json["key"],
        loudness: json["loudness"]?.toDouble(),
        mode: json["mode"],
        speechiness: json["speechiness"]?.toDouble(),
        acousticness: json["acousticness"]?.toDouble(),
        instrumentalness: json["instrumentalness"]?.toDouble(),
        liveness: json["liveness"]?.toDouble(),
        valence: json["valence"]?.toDouble(),
        tempo: json["tempo"],
        durationMs: json["duration_ms"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_name": trackName,
        "track_artist": trackArtist,
        "lyrics": lyrics,
        "track_popularity": trackPopularity,
        "track_album_id": trackAlbumId,
        "track_album_name": trackAlbumName,
        "track_album_release_date": "${trackAlbumReleaseDate.year.toString().padLeft(4, '0')}-${trackAlbumReleaseDate.month.toString().padLeft(2, '0')}-${trackAlbumReleaseDate.day.toString().padLeft(2, '0')}",
        "playlist_name": playlistName,
        "playlist_id": playlistId,
        "playlist_genre": playlistGenre,
        "playlist_subgenre": playlistSubgenre,
        "danceability": danceability,
        "energy": energy,
        "key": key,
        "loudness": loudness,
        "mode": mode,
        "speechiness": speechiness,
        "acousticness": acousticness,
        "instrumentalness": instrumentalness,
        "liveness": liveness,
        "valence": valence,
        "tempo": tempo,
        "duration_ms": durationMs,
        "language": language,
    };
}
