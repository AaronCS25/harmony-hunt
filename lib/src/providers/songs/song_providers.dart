import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/src/providers/songs/song_repository_provider.dart';
import 'package:ir2/domain/entities/entities.dart';

final songsByTracksProvider =
    StateNotifierProvider<SongsNotifier, List<Song>>((ref) {
  final fetchSongs = ref.watch(songRepositoryProvider).getSongsFromIds;
  return SongsNotifier(fetchSongs: fetchSongs);
});

typedef SongsCallback = Future<List<Song>> Function(List<String> tracksId);

class SongsNotifier extends StateNotifier<List<Song>> {
  SongsNotifier({required this.fetchSongs}) : super([]);

  SongsCallback fetchSongs;

  Future<void> loadSongsByTracks(List<String> tracksId) async {
    final List<Song> songs = await fetchSongs(tracksId);
    state = [...songs];
  }
}
