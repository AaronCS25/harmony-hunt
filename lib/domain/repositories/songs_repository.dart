import 'package:ir2/domain/entities/entities.dart';

abstract class SongRepository {
  Future<List<String>> getTrackIds({String query});
  Future<List<Song>> getSong({String trackId});
  Future<List<Song>> getAlbumSongs({String trackAlbumId});
}