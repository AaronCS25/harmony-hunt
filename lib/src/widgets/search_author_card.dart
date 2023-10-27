import 'package:flutter/material.dart';
import 'package:ir2/domain/entities/entities.dart';

class SearchAuthorCard extends StatelessWidget {
  const SearchAuthorCard({
    super.key,
    required this.artistSummary,
  });

  final ArtistSummary artistSummary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // * Image
            // TODO: REPLACE WITH IMAGE
            Container(
              width: 50,
              height: 50,
              color: Colors.grey,
            ),
            const SizedBox(width: 16),
            // * Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artistSummary.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    artistSummary.artistName,
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
