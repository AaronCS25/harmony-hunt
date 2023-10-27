import 'package:flutter/material.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/widgets/widgets.dart';

class SearchViewLeft extends StatefulWidget {
  const SearchViewLeft({super.key});

  @override
  State<SearchViewLeft> createState() => _SearchViewLeftState();
}

class _SearchViewLeftState extends State<SearchViewLeft> {
  String selectedButton = 'All';

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // *Back button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 16),
          // * Search bar
          TextField(
            style: textStyle.bodyMedium,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
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
                    buildOutlinedButton('All'),
                    buildOutlinedButton('Songs'),
                    buildOutlinedButton('Authors'),
                    buildOutlinedButton('Albums'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // * Query results
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                // return SearchSongCard(
                //   songSummary: SongSummary(
                //       imageUrl: '',
                //       title: 'Song name',
                //       author: 'Author name',
                //       duration: '3:00'),
                // );
                // return SearchAlbumCard(
                //   albumSummary: AlbumSummary(
                //     imageUrl: '',
                //     title: 'Album name',
                //     author: 'Malcom Todd',
                //     date: '2023',
                //   ),
                // );
                return SearchAuthorCard(
                  artistSummary: ArtistSummary(
                    imageUrl: '',
                    name: 'Malcom Todd',
                    artistName: 'Nickname2',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutlinedButton(String label) {
    final isSelected = selectedButton == label;
    final baseColor = isSelected ? Colors.blue : Colors.grey;
    final color = isSelected ? Colors.blue : Colors.grey.withOpacity(0.6);
    final textStyle = Theme.of(context).textTheme;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedButton = label;
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
