import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

final tracksByQueryProvider =
    StateNotifierProvider<TracksNotifier, List<OwnTrack>>((ref) {
  final fetchTracks = ref.watch(trackRepositoryProvider).getTracks;
  return TracksNotifier(fetchTracks: fetchTracks);
});

typedef TracksCallback = Future<List<OwnTrack>> Function(String query);

class TracksNotifier extends StateNotifier<List<OwnTrack>> {
  TracksNotifier({required this.fetchTracks}) : super([]);

  TracksCallback fetchTracks;

  Future<void> loadTracks(String query) async {
    final List<OwnTrack> tracks = await fetchTracks(query);
    state = [...tracks];
  }
  
}