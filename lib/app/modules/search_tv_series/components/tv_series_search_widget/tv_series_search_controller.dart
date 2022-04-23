import 'package:flutter/material.dart';
import '../../../../data/repositories/local_storage_repositories/i_local_storage_repository.dart';
import '../../../../data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';

class TvSeriesSearchController with ChangeNotifier {
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;
  final ILocalStorageRepository iLocalStorageRepository;

  TvSeriesSearchController(
      {required this.iTvSeriesDataSourceRepository,
      required this.iLocalStorageRepository});

  final tvSeriesSearchBarTextEditingController = TextEditingController();

  var foundTvSeries;

  bool isSearching = false;

  Future<void> fetchTvSeriesByName({required String tvSeriesName}) async {
    isSearching = true;
    notifyListeners();

    foundTvSeries = await iTvSeriesDataSourceRepository.searchForTvSeries(
        tvSeriesName: tvSeriesName);

    for (var tvSeries in foundTvSeries) {
      var _tvSeries = await iLocalStorageRepository.get(tvSeries.id);

      if (_tvSeries != null) {
        tvSeries.isFavorite = _tvSeries.isFavorite;
      } else {
        tvSeries.isFavorite = false;
      }
    }

    isSearching = false;
    notifyListeners();
  }
}
