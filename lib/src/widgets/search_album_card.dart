import 'package:flutter/material.dart';
import 'package:ir2/domain/entities/entities.dart';

class SearchAlbumCard extends StatelessWidget {
  const SearchAlbumCard({
    super.key,
    required this.albumSummary,
  });

  final AlbumSummary albumSummary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // * Image
            Image.network(
              albumSummary.imageUrl,
              width: 64,
              height: 64,
            ),
            const SizedBox(width: 16),
            // * Title - subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    albumSummary.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Álbum • ${albumSummary.author} ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
