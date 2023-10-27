import 'package:flutter/material.dart';
import 'package:ir2/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HarmonyHunt',
              style: textStyle.headlineLarge,
            ),
            const SizedBox(height: 16),
            const SearchBarMain(),
          ],
        ),
      ),
    );
  }
}
