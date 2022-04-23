abstract class ITvSeriesDataSourceRepository {
  Future getListOfTvSeriesByPage({int? page});

  Future searchForTvSeries({required String tvSeriesName});

  Future getListOfTvSeriesEpisodes({required int showId});

  Future searchForPeople({required String personName});
}
