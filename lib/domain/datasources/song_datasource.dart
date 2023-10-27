import 'package:ir2/domain/entities/entities.dart';

abstract class SongDataSource {
  Future<List<Song>> getSong({String trackId});
  Future<List<Song>> getAlbumSongs({String trackAlbumId});
}
