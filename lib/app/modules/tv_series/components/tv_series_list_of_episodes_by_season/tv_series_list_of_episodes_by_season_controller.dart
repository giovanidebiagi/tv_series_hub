import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_season_model.dart';

import '../../../../data/models/tv_series_episode_model.dart';
import '../../../../data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';

class TvSeriesListOfEpisodesBySeasonController with ChangeNotifier {
  TvSeriesListOfEpisodesBySeasonController(
      {required this.iTvSeriesDataSourceRepository});

  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;

  var listOfTvSeriesEpisodes;
  var listOfTvSeriesSeasons;

  Future<void> fetchTvSeriesEpisodesBySeason({required int showId}) async {
    listOfTvSeriesEpisodes = await iTvSeriesDataSourceRepository
        .getListOfTvSeriesEpisodes(showId: showId);

    listOfTvSeriesSeasons =
        organizeTvSeriesEpisodesBySeason(episodes: listOfTvSeriesEpisodes);
  }

  List<TvSeriesSeasonModel> organizeTvSeriesEpisodesBySeason(
      {required List<TvSeriesEpisodeModel> episodes}) {
    Map seasonsMap = {};
    List<TvSeriesSeasonModel> seasons = [];

    for (var episode in episodes) {
      seasonsMap.update(
        episode.season,
        (value) {
          value.add(episode);
          return value;
        },
        ifAbsent: () => [episode],
      );
    }

    for (var season in seasonsMap.keys) {
      seasons.add(
          TvSeriesSeasonModel(number: season, episodes: seasonsMap[season]));
    }

    return seasons;
  }
}
