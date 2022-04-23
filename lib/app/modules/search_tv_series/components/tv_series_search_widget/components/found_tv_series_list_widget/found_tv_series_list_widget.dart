import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';

import '../../tv_series_search_controller.dart';
import 'components/found_tv_series_card.dart';

class FoundTvSeriesListWidget extends StatelessWidget {
  const FoundTvSeriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TvSeriesSearchController>(
      builder: ((context, tvSeriesSearchController, child) {
        if (tvSeriesSearchController.isSearching) {
          return const Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: const Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        if (tvSeriesSearchController.foundTvSeries is HttpNotFoundError) {
          return const Text(
              'Oops! It seems data could not be retrieved from the servers. This could be temporary. Please try agina in a few moments.');
        } else if (tvSeriesSearchController.foundTvSeries is HttpCustomError) {
          return const Text('Please try again in a few moments.');
        } else if (tvSeriesSearchController.foundTvSeries is FormatException) {
          return const Text(
              'Oops! It seems the data retrieved by the servers is broken. This could be temporary. Please try again in a few moments.');
        } else if (tvSeriesSearchController.foundTvSeries is List &&
            tvSeriesSearchController.foundTvSeries.isEmpty) {
          return const Text(
              'Sorry, we could not find the TV Series you are looking for');
        } else if (tvSeriesSearchController.foundTvSeries == null) {
          return const SizedBox();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: tvSeriesSearchController.foundTvSeries.length,
          itemBuilder: (context, index) {
            return FoundTvSeriesCard(
                tvSeries: tvSeriesSearchController.foundTvSeries[index]);
          },
        );
      }),
    );
  }
}
