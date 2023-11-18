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

  List<String> tracksIds = [
    "0017A6SJgTbfQVU2EtsPNo",
    "004s3t0ONYlzxII9PLgU6z",
    "00chLpzhgVjxs1zKC9UScL",
    "00cqd6ZsSkLZqGMlQCR0Zo",
    "00emjlCv9azBN0fzuuyLqy",
    "00f9VGHfQhAHMCQ2bSjg3D",
    "00FROhC5g4iJdax5US8jRr",
    "00GfGwzlSB8DoA0cDP2Eit",
    "00Gu3RMpDW2vO9PjlMVFDL",
    "00GxbkrW4m1Tac5xySEJ4M",
    "00hdjyXt6MohKnCyDmhxOL",
    "00HIh9mVUQQAycsQiciWsh"
  ];

  List<String> albumsIds = [
    "1srJQ0njEQgd8w4XSqI4JQ",
    "3z04Lb9Dsilqw68SHt6jLB",
    "6oZ6brjB8x3GoeSYdwJdPc",
    "3ssspRe42CXkhPxdc12xcp",
    "7h5X3xhh3peIK9Y0qI5hbK",
    "3GNzXsFbzdwM0WKCZtgeNP",
    "2dHr0LpUe6CNV5lNsr8x0W",
    "51fAXJ5bMn7DRSunXQ6PMb",
    "5pqG85igfoeWcCDIsSi9x7"
  ];

  @override
  void initState() {
    super.initState();
    ref.read(songsByTracksProvider.notifier).loadSongs(tracksIds);
    ref.read(albumByIdsProvider.notifier).loadAlbums(albumsIds);
    _searchController.text = ref.read(searchQueryProvider);
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
                ref.read(searchQueryProvider.notifier).state = value;
                // TODO: AGREGAR NUEVA BUSQUEDA.
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
                    buildOutlinedButton('Songs', ButtonType.songs),
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
                        author: song.artistName,
                        duration: song.songDuration.toString(),
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
