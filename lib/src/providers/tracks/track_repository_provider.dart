import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/infraestructure/datasources/query_own_datasource.dart';
import 'package:ir2/infraestructure/repositories/query_own_repository_impl.dart';

final trackRepositoryProvider = Provider((ref) {
  return QueryRepositoryImpl(QueryOwnDatasource());
});
