import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:ir2/src/providers/providers.dart';

class MainSearchBar extends ConsumerWidget {
  const MainSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 128.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search your music here!',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Implement voice search
                    print('Voice search');
                  },
                  icon: const Icon(Icons.mic),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Implement image search
                    print('Image search');
                  },
                  icon: const Icon(Icons.image),
                ),
              ],
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.blue[400]!, width: 1.0),
          ),
        ),
        onSubmitted: (value) {
          // TODO: Implement search
          print('Submitted: $value');
          if (value.isNotEmpty) {
            ref.read(searchQueryProvider.notifier).state = value;
            context.go('/search');
          } else {
            print('Empty search');
            Fluttertoast.showToast(
              msg: 'Empty search',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.grey[800],
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      ),
    );
  }
}
