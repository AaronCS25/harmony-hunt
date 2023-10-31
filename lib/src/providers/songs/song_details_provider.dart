import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/songs/song_repository_provider.dart';

final songDetailProvider =
    StateNotifierProvider<SongMapperNotifier, Map<String, Song>>((ref) {
  final getSong = ref.watch(songRepositoryProvider).getSong;
  return SongMapperNotifier(getSong: getSong);
});

/*
{
  'A101': Song,
  'A102': Song,
  'A103': Song,
  ...
}
*/

typedef GetSongCallBack = Future<Song> Function(String trackId);

class SongMapperNotifier extends StateNotifier<Map<String, Song>> {
  SongMapperNotifier({required this.getSong}) : super({});

  final GetSongCallBack getSong;

  Future<void> loadSong(String trackId) async {
    final Song song = await getSong(trackId);
    state = {...state, trackId: song};
  }
}
