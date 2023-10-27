import 'package:ir2/domain/entities/entities.dart';

abstract class QueryRepository {
  // * Obtener los ids de las canciones relevantes a una búsqueda.
  Future<List<String>> getTrackIds({String query});

  // * Obtener la información de una canción.
  Future<Song> getSong({String trackId});

  // * Obtener la información de un conjunto de canciones.
  Future<List<Song>> getSongsFromIds({List<String> trackIds});

  // * Obtener la información de un album.
  Future<Album> getAlbum({String trackAlbumId});

  // * Obtener la información de un conjunto de albums.
  Future<List<Album>> getAlbumsFromIds({List<String> trackAlbumIds});
}
