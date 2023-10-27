class Album {
  String title;
  String albumType;
  String artistName;
  String urlAlbumSpotify;
  String generes;
  String urlCover;
  String releaseDate;
  int numberOfTracks;
  int popularity;

  Album({
    required this.title,
    required this.albumType,
    required this.artistName,
    required this.urlAlbumSpotify,
    required this.generes,
    required this.urlCover,
    required this.releaseDate,
    required this.numberOfTracks,
    required this.popularity,
  });
}
