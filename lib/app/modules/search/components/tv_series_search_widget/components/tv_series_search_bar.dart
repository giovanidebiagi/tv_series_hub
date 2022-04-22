import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import '../tv_series_search_controller.dart';

class TvSeriesSearchBar extends StatelessWidget {
  const TvSeriesSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tvSeriesSearchBarController =
        Provider.of<TvSeriesSearchController>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: TextField(
            controller: _tvSeriesSearchBarController
                .tvSeriesSearchBarTextEditingController,
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
        Consumer<TvSeriesSearchController>(
          builder: ((context, tvSeriesSearchBarController, child) {
            return ElevatedButton.icon(
              onPressed: !tvSeriesSearchBarController.isSearching
                  ? () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      await tvSeriesSearchBarController.fetchTvSeriesByName(
                          tvSeriesName: tvSeriesSearchBarController
                              .tvSeriesSearchBarTextEditingController.text);
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
