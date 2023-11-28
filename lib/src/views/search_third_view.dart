import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';
import 'package:ir2/src/widgets/similar_song_card.dart';
import 'package:ir2/src/widgets/widgets.dart';

class SearchInfoView extends ConsumerStatefulWidget {
  const SearchInfoView({super.key});

  @override
  SearchInfoViewState createState() => SearchInfoViewState();
}

class SearchInfoViewState extends ConsumerState<SearchInfoView> {
  String trackId = '';
  List<String> tracksIds = [];

  Future<void> fetchData(String trackIdawd) async {
    try {
      final response = await Dio().get(
        'https://z5dmtg4z-8000.brs.devtunnels.ms/multidimensional/faiss/knn?track_id=$trackIdawd&k=3',
      );

      if (response.statusCode == 200) {
        List<String> result = List<String>.from(response.data);
        print('Resultasdawd: $result');
        ref.read(songsSimilarByTracksProvider.notifier).loadSongs(result);
      } else {
        throw Exception('Error en la solicitud HTTP - Similar songs');
      }
    } catch (e) {
      throw Exception('Error en la solicitud HTTP - Similar songs');
    }
  }

  @override
  void initState() {
    super.initState();
    trackId = ref.read(selectedSongByTrackIdProvider);
    if (trackId != '') {
      ref.read(songInfoProvider.notifier).loadSong(trackId);
      fetchData(trackId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final newTrackId = ref.watch(selectedSongByTrackIdProvider);
    final songsSimilarByTrackId = ref.watch(songsSimilarByTracksProvider);

    if (newTrackId != trackId) {
      trackId = newTrackId;
      ref.read(songInfoProvider.notifier).loadSong(newTrackId);
      fetchData(newTrackId);
      // songsSimilarByTrackId = ref.watch(songsSimilarByTracksProvider);
      // print('songsSimilarByTrackId: ${songsSimilarByTrackId[0].title}');
    }

    final Song? song =
        newTrackId != '' ? ref.watch(songInfoProvider)[newTrackId] : null;

    if (song == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // *Close button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
            const SizedBox(height: 16),
            // * Title
            _InfoRow(
              textLabel: 'Title',
              textInfo: song.title,
              textStyle: textStyle,
            ),
            const SizedBox(height: 2),
            // * Album
            _InfoRow(
              textLabel: 'Album',
              textInfo: song.albumName,
              textStyle: textStyle,
            ),
            const SizedBox(height: 2),
            // * Artist
            _InfoRow(
              textLabel: 'Artist',
              textInfo: song.artistName,
              textStyle: textStyle,
            ),
            const SizedBox(height: 2),
            // * Realease Date
            _InfoRow(
              textLabel: 'Realease Date',
              textInfo: song.releaseDate.substring(0, 11), // TODO: FIX IT
              textStyle: textStyle,
            ),
            const SizedBox(height: 2),
            //* Lyrics
            _InfoRow(
              textLabel: 'Lyrics',
              textInfo:
                  '''They’ve been saying, you’re sophisticated (Stockholders) And now you don’t know how you could ever complain And now you don’t know how you could ever complain And then you did something wrong and they said it was great And then you did something wrong and they said it was great As I do it's not for you Because you’re all confused 'cause you want me to Because you’re all confused 'cause you want me to But I don’t, I don’t want anything But then it don’t make sense But then it don’t make sense But then you want me to do it the same as you But then you want me to do it the same way as you But without recompense But without recompense Climbing up your wall Climbing up your wall Don’t go there 'cause you’ll never return Don’t go there 'cause you’ll never return Here and everywhere I don’t want anyone I know it’s not, it’s not your fault I know you think of me when you think of her I know you think of me when you think of her I'll get it right some time Information’s here Maybe not tonight Maybe not tonight Maybe not tonight Maybe not tonight Maybe not tonight No more asking, questions or excuses Same shit different lie Say it after me Say it after me They will blame us, crucify, and shame us They’re complaining, over-educated We are trying hard to get your attention We can’t help it if we are a problem When you're trying hard to do the right thing When you’re trying hard to do the right thing You are saying all the words I'm dreaming You were saying all the words I'm dreaming You were waiting for the elevator ''',
              textStyle: textStyle,
            ),
            if (songsSimilarByTrackId.isNotEmpty)
              SimilarSongCard(
                songSummary: SongSummary(
                  imageUrl: songsSimilarByTrackId[0].urlCover,
                  title: songsSimilarByTrackId[0].title,
                  author: songsSimilarByTrackId[0].artistName,
                  duration: songsSimilarByTrackId[0].songDuration.toString(),
                  id: songsSimilarByTrackId[0].id,
                  urlToSongSpotify: songsSimilarByTrackId[0].urlToSongSpotify,
                ),
              ),
            if (songsSimilarByTrackId.length >= 2)
              SimilarSongCard(
                songSummary: SongSummary(
                  imageUrl: songsSimilarByTrackId[1].urlCover,
                  title: songsSimilarByTrackId[1].title,
                  author: songsSimilarByTrackId[1].artistName,
                  duration: songsSimilarByTrackId[1].songDuration.toString(),
                  id: songsSimilarByTrackId[1].id,
                  urlToSongSpotify: songsSimilarByTrackId[1].urlToSongSpotify,
                ),
              ),
            if (songsSimilarByTrackId.length >= 3)
              SimilarSongCard(
                songSummary: SongSummary(
                  imageUrl: songsSimilarByTrackId[2].urlCover,
                  title: songsSimilarByTrackId[2].title,
                  author: songsSimilarByTrackId[2].artistName,
                  duration: songsSimilarByTrackId[2].songDuration.toString(),
                  id: songsSimilarByTrackId[2].id,
                  urlToSongSpotify: songsSimilarByTrackId[2].urlToSongSpotify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.textLabel,
    required this.textInfo,
    required this.textStyle,
  });

  final TextTheme textStyle;
  final String textLabel;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: textStyle.titleSmall,
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: Text(
            textInfo,
            style: textStyle.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
