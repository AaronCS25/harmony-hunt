import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';
import 'package:ir2/src/widgets/widgets.dart';

enum ButtonType { songs, authors, albums }

class SearchViewLeft extends ConsumerStatefulWidget {
  const SearchViewLeft({super.key});

  @override
  SearchViewLeftState createState() => SearchViewLeftState();
}

class SearchViewLeftState extends ConsumerState<SearchViewLeft> {
  final TextEditingController _searchController = TextEditingController();

  ButtonType selectedButton = ButtonType.songs;
  bool valor = false;

  List<String> tracksIds = [];

  // List<String> albumsIds = [
  //   "1srJQ0njEQgd8w4XSqI4JQ",
  //   "3z04Lb9Dsilqw68SHt6jLB",
  //   "6oZ6brjB8x3GoeSYdwJdPc",
  //   "3ssspRe42CXkhPxdc12xcp",
  //   "7h5X3xhh3peIK9Y0qI5hbK",
  //   "3GNzXsFbzdwM0WKCZtgeNP",
  //   "2dHr0LpUe6CNV5lNsr8x0W",
  //   "51fAXJ5bMn7DRSunXQ6PMb",
  //   "5pqG85igfoeWcCDIsSi9x7"
  // ];

  void updateSearchResults(String newValue) {
    ref.read(searchQueryProvider.notifier).state =
        newValue; // actualiza el search
    ref
        .read(tracksByQueryProvider.notifier) // busca los tracks
        .loadTracks(newValue)
        .then((_) {
      tracksIds = ref
          .read(tracksByQueryProvider)
          .map((ownTrack) => ownTrack.trackId)
          .toList(); // actualiza los tracks
      ref
          .read(songsByTracksProvider.notifier)
          .loadSongs(tracksIds); // actualiza las canciones
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(searchQueryProvider);
    updateSearchResults(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final songsByQuery = ref.watch(songsByTracksProvider);
    final albumsByQuery = ref.watch(albumByIdsProvider);

    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // *Back button
          IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 16),
          // * Search bar
          TextField(
            style: textStyle.bodyMedium,
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                updateSearchResults(value);
              }
            },
          ),
          const SizedBox(height: 16),
          // * Selection Button
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    // buildOutlinedButton('Songs', ButtonType.songs),
                    // buildOutlinedButton('Albums', ButtonType.albums),
                    // buildOutlinedButton('Authors', ButtonType.authors),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Own', style: textStyle.bodySmall),
                        Switch.adaptive(
                          value: valor,
                          onChanged: (value) {
                            setState(() {
                              valor = value;
                            });
                          },
                          activeTrackColor: Colors.blueAccent,
                          activeColor: Colors.black,
                        ),
                        Text('Postgres', style: textStyle.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // * Query results
          Expanded(
            child: ListView.builder(
              itemCount: selectedButton == ButtonType.songs
                  ? songsByQuery.length
                  : selectedButton == ButtonType.albums
                      ? albumsByQuery.length
                      : 0,
              itemBuilder: (context, index) {
                switch (selectedButton) {
                  case ButtonType.songs:
                    final Song song = songsByQuery[index];
                    return SearchSongCard(
                      songSummary: SongSummary(
                        imageUrl: song.urlCover,
                        title: song.title,
                        urlToSongSpotify: song.urlToSongSpotify,
                        author: song.artistName,
                        duration: song.songDuration.toString(),
                        id: song.id,
                      ),
                    );
                  case ButtonType.albums:
                    final Album album = albumsByQuery[index];
                    return SearchAlbumCard(
                      albumSummary: AlbumSummary(
                        imageUrl: album.urlCover,
                        title: album.title,
                        author: album.artistName,
                        date: album.releaseDate,
                      ),
                    );
                  default:
                    return const Text('No results');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutlinedButton(String label, ButtonType type) {
    final isSelected = selectedButton == type;
    final baseColor = isSelected ? Colors.blue : Colors.grey;
    final color = isSelected ? Colors.blue : Colors.grey.withOpacity(0.6);
    final textStyle = Theme.of(context).textTheme;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedButton = type;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        backgroundColor: color.withOpacity(isSelected ? 0.0 : 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Text(label, style: textStyle.bodySmall!.copyWith(color: baseColor)),
      ),
    );
  }
}
