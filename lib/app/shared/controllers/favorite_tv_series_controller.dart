import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';
import 'package:tv_series_hub/app/data/repositories/local_storage_repositories/i_local_storage_repository.dart';

class FavoriteTvSeriesController extends ChangeNotifier {
  final ILocalStorageRepository iLocalStorageRepository;

  FavoriteTvSeriesController({required this.iLocalStorageRepository});

  var listOfFavoriteTvSeries = [];

  Future toggleFavorite({required TvSeriesModel tvSeries}) async {
    tvSeries.isFavorite = !tvSeries.isFavorite!;

    await iLocalStorageRepository.put(tvSeries);

    await createListOfFavoriteTvSeries();

    notifyListeners();
  }

  Future createListOfFavoriteTvSeries() async {
    listOfFavoriteTvSeries.clear();

    for (var key in iLocalStorageRepository.contents.keys) {
      var tvSeries = await iLocalStorageRepository.get(key);

      if (tvSeries.isFavorite) {
        listOfFavoriteTvSeries.add(tvSeries);
      }
    }

    listOfFavoriteTvSeries.sort((a, b) => a.name.compareTo(b.name));
  }
}
