import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ir2/config/helpers/human_formats.dart';
import 'package:ir2/domain/entities/entities.dart';
import 'package:url_launcher/url_launcher.dart';

class SimilarSongCard extends ConsumerWidget {
  const SimilarSongCard({
    super.key,
    required this.songSummary,
  });

  final SongSummary songSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () async {
          final Uri url = Uri.parse(songSummary.urlToSongSpotify);
          try {
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          } catch (e) {
            // Manejar la excepción
            print(e);
          }
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
