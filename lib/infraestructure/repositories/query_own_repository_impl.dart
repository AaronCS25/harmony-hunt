import 'package:ir2/domain/repositories/query_repository.dart';
import 'package:ir2/domain/datasources/query_datasource.dart';
import 'package:ir2/domain/entities/entities.dart';

class QueryRepositoryImpl extends QueryRepository {
  final QueryDatasource datasource;
  QueryRepositoryImpl(this.datasource);

  @override
  Future<List<OwnTrack>> getTracks(String query) {
    return datasource.getTracks(query);
  }
}
