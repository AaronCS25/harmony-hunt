import 'package:flutter/material.dart';
import 'package:ir2/domain/entities/entities.dart';

class SearchSongCard extends StatelessWidget {
  const SearchSongCard({
    super.key,
    required this.songSummary,
  });

  final SongSummary songSummary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // * Image
            Image.network(
              songSummary.imageUrl,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16),
            // * Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songSummary.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    songSummary.author,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            //* Duration
            Text(
              songSummary.duration,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // * Button
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.more_vert),
            // ),
          ],
        ),
      ),
    );
  }
}
