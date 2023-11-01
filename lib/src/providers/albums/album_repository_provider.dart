import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/infraestructure/datasources/song_info_spotify_datasource.dart';
import 'package:ir2/infraestructure/repositories/song_info_spotify_repository_impl.dart';

final albumRepositoryProvider = Provider((ref) {
  return SongInfoRepositoryImpl(SongInfoSpotifyDatasource());
});
