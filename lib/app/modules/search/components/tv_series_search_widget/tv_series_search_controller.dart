import 'package:flutter/material.dart';
import '../../../../data/repositories/i_tv_series_data_source_repository.dart';

class TvSeriesSearchController with ChangeNotifier {
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;

  TvSeriesSearchController({required this.iTvSeriesDataSourceRepository});

  final tvSeriesSearchBarTextEditingController = TextEditingController();

  var foundTvSeries;

  bool isSearching = false;

  Future<void> fetchTvSeriesByName({required String tvSeriesName}) async {
    isSearching = true;
    notifyListeners();

    foundTvSeries = await iTvSeriesDataSourceRepository.searchForTvSeries(
        tvSeriesName: tvSeriesName);

    isSearching = false;
    notifyListeners();
  }
}
