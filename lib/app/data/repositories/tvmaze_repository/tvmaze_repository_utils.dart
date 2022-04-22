import 'dart:convert';

import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';

class TvmazeRepositoryUtils {
  static convertTvmazeResponseToListOfTvSeriesModel(String responseStr) {
    try {
      var tvSeriesJson = jsonDecode(responseStr) as List;

      List<TvSeriesModel> tvSeriesList = [];

      for (var tvSeries in tvSeriesJson) {
        tvSeriesList.add(TvSeriesModel.fromMap(tvSeries));
      }

      return tvSeriesList;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  static convertTvmazeSearchResponseToListOfTvSeriesModel(String responseStr) {
    try {
      var tvSeriesJson = jsonDecode(responseStr) as List;

      List<TvSeriesModel> tvSeriesList = [];

      for (var tvSeries in tvSeriesJson) {
        var tvSeriesData = TvSeriesModel.fromMap(tvSeries['show']);

        // tvSeriesData.rating = tvSeries['rating']['average'];

        tvSeriesList.add(tvSeriesData);
      }

      return tvSeriesList;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  static convertTvMazeTvSeriesEpisodesResponseToListOfTvSeriesEpisodeModel(
      String responseStr) {
    try {
      var tvSeriesEpisodes = jsonDecode(responseStr) as List;

      List<TvSeriesEpisodeModel> tvSeriesEpisodesList = [];

      for (var tvSeriesEpisode in tvSeriesEpisodes) {
        var tvSeriesEpisodeData = TvSeriesEpisodeModel.fromMap(tvSeriesEpisode);

        tvSeriesEpisodesList.add(tvSeriesEpisodeData);
      }

      return tvSeriesEpisodesList;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }
}
