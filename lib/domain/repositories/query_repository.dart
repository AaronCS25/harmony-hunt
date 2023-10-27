abstract class QueryRepository {
  // * Obtener los ids de las canciones relevantes a una búsqueda.
  Future<List<String>> getTrackIds(String query);
}
