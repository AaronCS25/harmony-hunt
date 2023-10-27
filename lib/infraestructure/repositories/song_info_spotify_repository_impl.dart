import 'package:ir2/domain/datasources/song_info_datasource.dart';
import 'package:ir2/domain/entities/album/album.dart';
import 'package:ir2/domain/entities/song/song.dart';
import 'package:ir2/domain/repositories/song_infor_repository.dart';

class SongInfoRepositoryImpl extends SongInfoRepository {
  final SongInfoDatasource datasource;
  SongInfoRepositoryImpl(this.datasource);

  @override
  Future<Song> getSong(String trackId) {
    return datasource.getSong(trackId);
  }

  @override
  Future<List<Song>> getSongsFromIds(List<String> trackIds) {
    return datasource.getSongsFromIds(trackIds);
  }

  @override
  Future<Album> getAlbum(String trackAlbumId) {
    return datasource.getAlbum(trackAlbumId);
  }

  @override
  Future<List<Album>> getAlbumsFromIds(List<String> trackAlbumIds) {
    return datasource.getAlbumsFromIds(trackAlbumIds);
  }
}
