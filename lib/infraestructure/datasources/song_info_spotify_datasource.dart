import 'package:ir2/domain/datasources/song_info_datasource.dart';
import 'package:ir2/infraestructure/mappers/album_mapper.dart';
import 'package:ir2/infraestructure/mappers/song_mapper.dart';
import 'package:ir2/infraestructure/models/models.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:dio/dio.dart';

class SongInfoSpotifyDatasource extends SongInfoDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.spotify.com/v1/', headers: {
      'Authorization':
          'Bearer BQCbDkeiISAg8_tPOqN2W28Ac5uKEWemIJCSW7tbmfBAlpz6Dz7E2LtygTXbBGgD26ljlV2hsNsfjCYKc57u38YsHzfmIwZTiU4Qegsh8Z_1vV6zy50'
    }),
  );

  @override
  Future<Song> getSong(String trackId) async {
    try {
      final response = await dio.get('tracks/$trackId');

      if (response.statusCode == 200) {
        final trackByIdResponse = TrackByIdResponse.fromJson(response.data);
        final song = SongMapper.spotifyTrackToEntity(trackByIdResponse);
        return song;
      } else {
        throw Exception('Failed to load track');
      }
    } catch (e) {
      throw Exception('Error getting track: $e');
    }
  }

  @override
  Future<List<Song>> getSongsFromIds(List<String> trackIds) async {
    try {
      final List<Future<Song>> songFutures = [];

      for (String trackId in trackIds) {
        songFutures.add(getSong(trackId));
      }

      final List<Song> songs = await Future.wait(songFutures);
      return songs;
    } catch (e) {
      throw Exception('Error getting tracks: $e');
    }
  }

  @override
  Future<Album> getAlbum(String trackAlbumId) async {
    try {
      final response = await dio.get('albums/$trackAlbumId');

      if (response.statusCode == 200) {
        final albumByIdResponse = AlbumByIdResponse.fromJson(response.data);
        final album = AlbumMapper.spotifyAlbumToEntity(albumByIdResponse);
        return album;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Error getting album: $e');
    }
  }

  @override
  Future<List<Album>> getAlbumsFromIds(List<String> trackAlbumIds) async {
    try {
      final List<Future<Album>> albumFutures = [];

      for (String trackAlbumId in trackAlbumIds) {
        albumFutures.add(getAlbum(trackAlbumId));
      }

      final List<Album> albums = await Future.wait(albumFutures);
      return albums;
    } catch (e) {
      throw Exception('Error getting albums: $e');
    }
  }
}
