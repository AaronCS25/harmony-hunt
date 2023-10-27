import 'package:ir2/domain/entities/entities.dart';

abstract class QueryRepository {
  // * Obtener los ids de las canciones relevantes a una búsqueda.
  Future<List<OwnTrack>> getTracks(String query);
}
