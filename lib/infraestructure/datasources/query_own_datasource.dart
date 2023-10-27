import 'package:ir2/domain/datasources/query_datasource.dart';
import 'package:ir2/infraestructure/models/models.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:dio/dio.dart';

class QueryOwnDatasource extends QueryDatasource {
  final dio = Dio(
    BaseOptions(
      // TODO: Cambiar por la url de la api.
      baseUrl: 'my-own-api.com',
    ),
  );

  @override
  Future<List<OwnTrack>> getTracks(String query) async {
    try {
      final response = await dio.get('/search', queryParameters: {'q': query});

      if (response.statusCode == 200) {
        final List<QueryTrackResponse> queryTracks = response.data['results']
            .map<QueryTrackResponse>(
                (result) => QueryTrackResponse.fromJson(result))
            .toList();
        final List<OwnTrack> ownTracks = queryTracks
            .map<OwnTrack>((result) => OwnTrack(
                  track_id: result.trackId,
                  album_track_id: result.trackAlbumId,
                  lyrics: result.lyrics,
                ))
            .toList();
        return ownTracks;
      } else {
        throw Exception('Error al obtener los IDs de las canciones');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}
