import 'package:ir2/domain/entities/entities.dart';

abstract class QueryDatasource {
  // * Obtener los ids de las canciones relevantes a una búsqueda.
  Future<List<OwnTrack>> getTrackIds(String query);
}
