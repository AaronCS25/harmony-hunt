import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

final songsSimilarByTracksProvider =
    StateNotifierProvider<SongsSimilarNotifier, List<Song>>((ref) {
  final fetchSongs = ref.watch(songRepositoryProvider).getSongsFromIds;
  return SongsSimilarNotifier(fetchSongs: fetchSongs);
});

typedef SongsSimilarCallback = Future<List<Song>> Function(List<String> tracksId);

class SongsSimilarNotifier extends StateNotifier<List<Song>> {
  SongsSimilarNotifier({required this.fetchSongs}) : super([]);

  SongsSimilarCallback fetchSongs;

  Future<void> loadSongs(List<String> tracksId) async {
    final List<Song> songs = await fetchSongs(tracksId);
    state = [...songs];
  }
}
