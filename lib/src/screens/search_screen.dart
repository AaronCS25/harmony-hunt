import 'package:flutter/material.dart';
import 'package:ir2/src/views/views.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const name = 'search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDivided = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // *Left section 1/3
          const Expanded(
            flex: 1,
            child: SearchViewLeft(),
          ),
          // *Rigth section 2/3
          Expanded(
            flex: 2,
            child: Container(
                // color: Colors.green,
                child: isDivided
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: const Text('1/3'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.black,
                              child: const Center(
                                child: SearchInfoView(),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: Text('2/3'),
                      )),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isDivided = !isDivided;
              });
            },
            child: const Icon(Icons.swap_horizontal_circle),
          ),
        ],
      ),
    );
  }
}
