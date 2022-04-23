import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import '../people_search_controller.dart';

class PeopleSearchBar extends StatelessWidget {
  const PeopleSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _peopleSearchController =
        Provider.of<PeopleSearchController>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: TextField(
            controller:
                _peopleSearchController.peopleSearchBarTextEditingController,
            style: TextStyle(color: AppTheme.secondaryTextColor),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Consumer<PeopleSearchController>(
          builder: ((context, peopleSearchController, child) {
            return ElevatedButton.icon(
              onPressed: !_peopleSearchController.isSearching
                  ? () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      await _peopleSearchController.fetchPeopleByName(
                          personName: peopleSearchController
                              .peopleSearchBarTextEditingController.text);
                    }
                  : null,
              icon: const Icon(Icons.search),
              label: const Text('Search'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
