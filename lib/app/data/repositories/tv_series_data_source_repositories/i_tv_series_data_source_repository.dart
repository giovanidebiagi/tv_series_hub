abstract class ITvSeriesDataSourceRepository {
  Future getListOfTvSeriesByPage({int? page});

  Future searchForTvSeries({required String tvSeriesName});

  Future getTvSeriesById({required String tvSeriesId});

  Future getListOfTvSeriesEpisodes({required int showId});

  Future searchForPeople({required String personName});

  Future getListOfTvSeriesByPerson({required int personId});
}
