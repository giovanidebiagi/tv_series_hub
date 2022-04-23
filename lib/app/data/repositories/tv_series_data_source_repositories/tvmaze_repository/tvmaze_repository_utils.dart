import 'dart:convert';

import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';

import '../../../models/person_model.dart';

class TvmazeRepositoryUtils {
  static convertTvmazeTvSeriesResponseToTvSeriesModel(String responseStr) {
    try {
      var tvSeriesJson = jsonDecode(responseStr);

      return TvSeriesModel.fromMap(tvSeriesJson);
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

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

  static convertTvmazeSearchTvSeriesResponseToListOfTvSeriesModel(
      String responseStr) {
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

  static convertTvmazeSearchPeopleResponseToListOfPersonModel(
      String responseStr) {
    try {
      var peopleJson = jsonDecode(responseStr) as List;

      List<PersonModel> peopleList = [];

      for (var person in peopleJson) {
        var personData = PersonModel.fromMap(person['person']);

        peopleList.add(personData);
      }

      return peopleList;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  static getPersonTvSeriesIds(String responseStr) {
    var personTvSeriesJson = jsonDecode(responseStr) as List;

    List<String> personTvSeriesIds = [];

    for (var personTvSeries in personTvSeriesJson) {
      var personTvSeriesUrl =
          _getPersonTvSeriesUrl(personTvSeriesMap: personTvSeries);

      if (personTvSeriesUrl != null) {
        var personTvSeriesId = personTvSeriesUrl.split('/').last;

        personTvSeriesIds.add(personTvSeriesId);
      }
    }

    return personTvSeriesIds;
  }

  static String? _getPersonTvSeriesUrl({required Map personTvSeriesMap}) {
    if (personTvSeriesMap['_links'] != null) {
      if (personTvSeriesMap['_links']['show'] != null) {
        return personTvSeriesMap['_links']['show']['href'];
      }
    }

    return null;
  }
}
