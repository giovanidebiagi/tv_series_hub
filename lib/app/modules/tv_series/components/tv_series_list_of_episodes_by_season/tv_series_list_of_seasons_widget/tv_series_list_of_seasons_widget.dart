import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_episodes_by_season_controller.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_seasons_widget/components/tv_series_season_card/tv_series_season_card.dart';

import '../../../../../services/http_services/http_errors.dart';

class TvSeriesListOfSeasonsWidget extends StatefulWidget {
  const TvSeriesListOfSeasonsWidget({Key? key, required this.tvSeriesId})
      : super(key: key);

  final int tvSeriesId;

  @override
  State<TvSeriesListOfSeasonsWidget> createState() =>
      _TvSeriesListOfSeasonsWidgetState();
}

class _TvSeriesListOfSeasonsWidgetState
    extends State<TvSeriesListOfSeasonsWidget> {
  Future? _getListOfEpisodesBySeason;

  @override
  void initState() {
    _getListOfEpisodesBySeason =
        Provider.of<TvSeriesListOfEpisodesBySeasonController>(context,
                listen: false)
            .fetchTvSeriesEpisodesBySeason(showId: widget.tvSeriesId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tvSeriesListOfEpisodesBySeasonController =
        Provider.of<TvSeriesListOfEpisodesBySeasonController>(context,
            listen: false);

    return FutureBuilder(
      future: _getListOfEpisodesBySeason,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: const Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (_tvSeriesListOfEpisodesBySeasonController
            .listOfTvSeriesSeasons is HttpNotFoundError) {
          return const Text(
              'Oops! It seems data could not be retrieved from the servers. This could be temporary. Please try agina in a few moments.');
        } else if (_tvSeriesListOfEpisodesBySeasonController
            .listOfTvSeriesSeasons is HttpCustomError) {
          return const Text('Please try again in a few moments.');
        } else if (_tvSeriesListOfEpisodesBySeasonController
            .listOfTvSeriesSeasons is FormatException) {
          return const Text(
              'Oops! It seems the data retrieved by the servers is broken. This could be temporary. Please try again in a few moments.');
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 2,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _tvSeriesListOfEpisodesBySeasonController
              .listOfTvSeriesSeasons.length,
          itemBuilder: (context, index) {
            return TvSeriesSeasonCard(
                tvSeriesSeason: _tvSeriesListOfEpisodesBySeasonController
                    .listOfTvSeriesSeasons[index]);
          },
        );
      },
    );
  }
}
