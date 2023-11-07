import 'package:flutter/material.dart';

class SearchInfoView extends StatefulWidget {
  const SearchInfoView({super.key});

  @override
  State<SearchInfoView> createState() => _SearchInfoViewState();
}

class _SearchInfoViewState extends State<SearchInfoView> {
  String trackId = '';

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Text(
                  'Title:',
                  style: textStyle.titleSmall,
                ),
                const SizedBox(width: 8),
                Text(
                  'The New Abnormal',
                  style: textStyle.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 2),
            // * Album
            Row(
              children: [
                Text(
                  'Album:',
                  style: textStyle.titleSmall,
                ),
                const SizedBox(width: 8),
                Text(
                  'The New Abnormal',
                  style: textStyle.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 2),
            // * Artist
            Row(
              children: [
                Text(
                  'Artist:',
                  style: textStyle.titleSmall,
                ),
                const SizedBox(width: 8),
                Text(
                  'The Strokes',
                  style: textStyle.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 2),
            // * Realease Date
            Row(
              children: [
                Text(
                  'Realease Date:',
                  style: textStyle.titleSmall,
                ),
                const SizedBox(width: 8),
                Text(
                  '2020-20-09',
                  style: textStyle.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 2),
            //* Lyrics
            Text(
              'Lyrics:',
              style: textStyle.titleSmall,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                '''They’ve been saying, you’re sophisticated (Stockholders) And now you don’t know how you could ever complain And now you don’t know how you could ever complain And then you did something wrong and they said it was great And then you did something wrong and they said it was great As I do it's not for you Because you’re all confused 'cause you want me to Because you’re all confused 'cause you want me to But I don’t, I don’t want anything But then it don’t make sense But then it don’t make sense But then you want me to do it the same as you But then you want me to do it the same way as you But without recompense But without recompense Climbing up your wall Climbing up your wall Don’t go there 'cause you’ll never return Don’t go there 'cause you’ll never return Here and everywhere I don’t want anyone I know it’s not, it’s not your fault I know you think of me when you think of her I know you think of me when you think of her I'll get it right some time Information’s here Maybe not tonight Maybe not tonight Maybe not tonight Maybe not tonight Maybe not tonight No more asking, questions or excuses Same shit different lie Say it after me Say it after me They will blame us, crucify, and shame us They’re complaining, over-educated We are trying hard to get your attention We can’t help it if we are a problem When you're trying hard to do the right thing When you’re trying hard to do the right thing You are saying all the words I'm dreaming You were saying all the words I'm dreaming You were waiting for the elevator ''',
                style: textStyle.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
