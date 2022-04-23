import 'package:flutter/material.dart';

import '../../../../data/repositories/local_storage_repositories/i_local_storage_repository.dart';
import '../../../../data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';

class PersonListOfTvSeriesController extends ChangeNotifier {
  var listOfPersonTvSeries;
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;
  final ILocalStorageRepository iLocalStorageRepository;

  PersonListOfTvSeriesController({
    required this.iTvSeriesDataSourceRepository,
    required this.iLocalStorageRepository,
  });

  Future<void> fetchPersonListOfTvSeries({required int personId}) async {
    listOfPersonTvSeries = await iTvSeriesDataSourceRepository
        .getListOfTvSeriesByPerson(personId: personId);

    for (var personTvSeries in listOfPersonTvSeries) {
      var _personTvSeries =
          await iLocalStorageRepository.get(personTvSeries.id);

      if (_personTvSeries != null) {
        personTvSeries.isFavorite = _personTvSeries.isFavorite;
      } else {
        personTvSeries.isFavorite = false;
      }
    }

    notifyListeners();
  }
}
