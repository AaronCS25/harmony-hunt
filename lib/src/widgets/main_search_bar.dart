import 'package:flutter/material.dart';
import 'package:ir2/src/widgets/widgets.dart';

class SearchBarMain extends StatefulWidget {
  const SearchBarMain({
    super.key,
  });

  @override
  State<SearchBarMain> createState() => _SearchBarMainState();
}

class _SearchBarMainState extends State<SearchBarMain> {
  final SearchController _searchController = SearchController();

  final leading = const Icon(Icons.search);
  final trailing = [
    IconButton(
      icon: const Icon(Icons.keyboard_voice),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.camera_alt),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      viewHintText: 'Search your music here!',
      searchController: _searchController,
      viewConstraints: const BoxConstraints(maxHeight: 290),
      builder: (context, controller) {
        return SearchBar(
          controller: controller,
          onSubmitted: (value) {
            //TODO: NO FUNCIONA EL ENTER
            print('Submitted: $value');
          },
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: leading,
          // trailing: trailing,
        );
      },
      suggestionsBuilder: (context, controller) {
        return List<MusicCardSearchWidget>.generate(
          2,
          (index) => MusicCardSearchWidget(
            title: 'The new abnormal',
            duration: '5:00',
            onTap: () {
              controller.closeView('Persona5');
              //TODO: AGREGAR REDIRECCIÓN
            },
          ),
        );
      },
    );
  }
}
