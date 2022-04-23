import 'package:flutter/material.dart';
import '../../../../data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';

class PeopleSearchController with ChangeNotifier {
  final ITvSeriesDataSourceRepository iTvSeriesDataSourceRepository;

  PeopleSearchController({required this.iTvSeriesDataSourceRepository});

  final peopleSearchBarTextEditingController = TextEditingController();

  var foundPeople;

  bool isSearching = false;

  Future<void> fetchPeopleByName({required String personName}) async {
    isSearching = true;
    notifyListeners();

    foundPeople = await iTvSeriesDataSourceRepository.searchForPeople(
        personName: personName);

    isSearching = false;
    notifyListeners();
  }
}
