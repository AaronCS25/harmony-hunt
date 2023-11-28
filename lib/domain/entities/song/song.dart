class Song {
  String id;
  String title;
  String artistName;
  String urlArtistPageSpotify;
  String albumName;
  String albumType;
  String urlAlbumSpotify;
  String releaseDate;
  int songDuration;
  int trackNumberOnTheAlbum;
  int popularity;
  String urlToSongSpotify;
  String urlCover;

  Song({
    required this.id,
    required this.title,
    required this.artistName,
    required this.urlArtistPageSpotify,
    required this.albumName,
    required this.albumType,
    required this.urlAlbumSpotify,
    required this.releaseDate,
    required this.songDuration,
    required this.trackNumberOnTheAlbum,
    required this.popularity,
    required this.urlToSongSpotify,
    required this.urlCover,
  });
}
