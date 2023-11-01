import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

final albumDetailProvider =
    StateNotifierProvider<AlbumMapperNotifier, Map<String, Album>>((ref) {
  final getAlbum = ref.watch(albumRepositoryProvider).getAlbum;
  return AlbumMapperNotifier(getAlbum: getAlbum);
});

/*
{
  'A101': Album,
  'A102': Album,
  'A103': Album,
  ...
}
*/

typedef GetAlbumCallBack = Future<Album> Function(String albumId);

class AlbumMapperNotifier extends StateNotifier<Map<String, Album>> {
  AlbumMapperNotifier({required this.getAlbum}) : super({});

  final GetAlbumCallBack getAlbum;

  Future<void> loadAlbum(String albumId) async {
    final Album album = await getAlbum(albumId);
    state = {...state, albumId: album};
  }
}