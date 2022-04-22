import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/repositories/local_storage_repositories/i_local_storage_repository.dart';
import 'package:tv_series_hub/app/data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';

class ListOfAllTvSeriesByPageController with ChangeNotifier {
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;
  final ILocalStorageRepository iLocalStorageRepository;

  ListOfAllTvSeriesByPageController(
      {required this.iTvSeriesDataSourceRepository,
      required this.iLocalStorageRepository});

  bool isFetchingAllTvSeriesByPage = false;

  var listOfAllTvSeriesByPage;

  int currentPage = 0;
  int numberOfRetries = 0;

  goToNextPage() async {
    isFetchingAllTvSeriesByPage = true;
    notifyListeners();

    currentPage++;

    await fetchAllTvSeriesByPage();

    isFetchingAllTvSeriesByPage = false;
    notifyListeners();
  }

  goToPreviousPage() async {
    if (currentPage > 0) {
      isFetchingAllTvSeriesByPage = true;
      notifyListeners();

      currentPage--;

      await fetchAllTvSeriesByPage();

      isFetchingAllTvSeriesByPage = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllTvSeriesByPage() async {
    listOfAllTvSeriesByPage = await iTvSeriesDataSourceRepository
        .getListOfTvSeriesByPage(page: currentPage);

    for (var tvSeries in listOfAllTvSeriesByPage) {
      var _tvSeries = await iLocalStorageRepository.get(tvSeries.id);

      if (_tvSeries != null) {
        tvSeries.isFavorite = _tvSeries.isFavorite;
      } else {
        tvSeries.isFavorite = false;
      }
    }

    notifyListeners();
  }

  update() {
    notifyListeners();
  }
}
