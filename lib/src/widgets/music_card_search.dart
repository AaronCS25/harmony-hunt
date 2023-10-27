import 'package:flutter/material.dart';

class MusicCardSearchWidget extends StatelessWidget {
  const MusicCardSearchWidget({
    super.key,
    this.imageUrl =
        'https://upload.wikimedia.org/wikipedia/en/f/f8/The_Strokes_-_The_New_Abnormal.png',
    required this.title,
    required this.duration,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final String duration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.network(imageUrl, width: 80, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textStyle.titleSmall),
                  Text(duration, style: textStyle.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
