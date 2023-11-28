import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/config/helpers/human_formats.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/src/providers/providers.dart';

class SearchSongCard extends ConsumerWidget {
  const SearchSongCard({
    super.key,
    required this.songSummary,
  });

  final SongSummary songSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          ref.read(selectedSongByTrackIdProvider.notifier).state =
              songSummary.id;
        },
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
                      overflow: TextOverflow.ellipsis,
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
                HumanFormats.reproductionTime(songSummary.duration),
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
      ),
    );
  }
}
