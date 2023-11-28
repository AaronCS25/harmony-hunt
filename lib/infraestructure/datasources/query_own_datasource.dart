import 'package:ir2/domain/datasources/query_datasource.dart';
import 'package:ir2/infraestructure/models/models.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:dio/dio.dart';

class QueryOwnDatasource extends QueryDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://3.21.206.236:8000/",
      // baseUrl: "https://z5dmtg4z-8000.brs.devtunnels.ms/",
      // connectTimeout: const Duration(seconds: 10),
      // receiveTimeout: const Duration(seconds: 3),
    ),
  );

  @override
  Future<List<OwnTrack>> getTracks(String query) async {
    try {
      final response =
          await dio.get('local/text', queryParameters: {'keywords': query});
      if (response.statusCode == 200) {
        final List<QueryTrackResponse> queryTracks = response.data
            .map<QueryTrackResponse>(
                (result) => QueryTrackResponse.fromJson(result))
            .toList();
        final List<OwnTrack> ownTracks = queryTracks
            .map<OwnTrack>((result) =>
                OwnTrack(trackId: result.trackId, score: result.score))
            .toList();
        return ownTracks;
      } else {
        throw Exception('Error al obtener los IDs de las canciones');
      }
    } catch (e) {
      throw Exception('Error de red - query own datasource: $e');
    }
  }
}
