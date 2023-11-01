import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

final albumByIdsProvider =
    StateNotifierProvider<AlbumsNotifier, List<Album>>((ref) {
  final fetchAlbums = ref.watch(albumRepositoryProvider).getAlbumsFromIds;
  return AlbumsNotifier(fetchAlbums: fetchAlbums);
});

typedef AlbumsCallback = Future<List<Album>> Function(List<String> albumsId);

class AlbumsNotifier extends StateNotifier<List<Album>> {
  AlbumsNotifier({required this.fetchAlbums}) : super([]);

  AlbumsCallback fetchAlbums;

  Future<void> loadAlbums(List<String> albumsId) async {
    final List<Album> albums = await fetchAlbums(albumsId);
    state = [...albums];
  }
}
