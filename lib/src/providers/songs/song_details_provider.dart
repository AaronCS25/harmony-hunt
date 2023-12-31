import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

final songInfoProvider =
    StateNotifierProvider<SongMapperNotifier, Map<String, Song>>((ref) {
  final getSong = ref.watch(songRepositoryProvider).getSong;
  return SongMapperNotifier(getSong: getSong);
});

/*
{
  'S101': Song,
  'S102': Song,
  'S103': Song,
  ...
}
*/

typedef GetSongCallBack = Future<Song> Function(String trackId);

class SongMapperNotifier extends StateNotifier<Map<String, Song>> {
  SongMapperNotifier({required this.getSong}) : super({});

  final GetSongCallBack getSong;

  Future<void> loadSong(String trackId) async {
    if (state[trackId] != null) return;
    print('loadSong: $trackId');
    final Song song = await getSong(trackId);
    state = {...state, trackId: song};
  }
}
