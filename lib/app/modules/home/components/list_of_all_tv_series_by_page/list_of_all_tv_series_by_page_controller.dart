import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/repositories/i_tv_series_data_source_repository.dart';

class ListOfAllTvSeriesByPageController with ChangeNotifier {
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;

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

  ListOfAllTvSeriesByPageController(
      {required this.iTvSeriesDataSourceRepository});

  Future<void> fetchAllTvSeriesByPage() async {
    listOfAllTvSeriesByPage = await iTvSeriesDataSourceRepository
        .getListOfTvSeriesByPage(page: currentPage);

    notifyListeners();
  }

  update() {
    notifyListeners();
  }
}
