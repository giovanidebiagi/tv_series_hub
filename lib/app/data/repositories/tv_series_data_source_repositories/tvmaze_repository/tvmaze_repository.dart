import 'package:tv_series_hub/app/data/repositories/tv_series_data_source_repositories/i_tv_series_data_source_repository.dart';
import 'package:tv_series_hub/app/data/repositories/tv_series_data_source_repositories/tvmaze_repository/tvmaze_api_constants.dart';
import 'package:tv_series_hub/app/data/repositories/tv_series_data_source_repositories/tvmaze_repository/tvmaze_repository_utils.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';
import 'package:tv_series_hub/app/services/http_services/i_http_service.dart';

class TvmazeRepository implements ITvSeriesDataSourceRepository {
  final IHttpService httpService;

  TvmazeRepository({required this.httpService});

  @override
  Future getListOfTvSeriesByPage({int? page}) async {
    final _responseStr = await httpService.get(
        url: '$tvmazeApiBaseUrl/shows', queryParameters: {'page': page ?? 0});

    if (_responseStr is HttpError) {
      return _responseStr;
    }

    return TvmazeRepositoryUtils.convertTvmazeResponseToListOfTvSeriesModel(
        _responseStr);
  }

  @override
  Future searchForTvSeries({required String tvSeriesName}) async {
    final _responseStr = await httpService.get(
      url: '$tvmazeApiBaseUrl/search/shows',
      queryParameters: {'q': tvSeriesName},
    );

    if (_responseStr is HttpError) {
      return _responseStr;
    }

    if (_responseStr == '[]') {
      return [];
    }

    return TvmazeRepositoryUtils
        .convertTvmazeSearchTvSeriesResponseToListOfTvSeriesModel(_responseStr);
  }

  @override
  Future getListOfTvSeriesEpisodes({required int showId}) async {
    final _responseStr =
        await httpService.get(url: '$tvmazeApiBaseUrl/shows/$showId/episodes');

    if (_responseStr is HttpError) {
      return _responseStr;
    }

    return TvmazeRepositoryUtils
        .convertTvMazeTvSeriesEpisodesResponseToListOfTvSeriesEpisodeModel(
            _responseStr);
  }

  @override
  Future searchForPeople({required String personName}) async {
    final _responseStr = await httpService.get(
      url: '$tvmazeApiBaseUrl/search/people',
      queryParameters: {'q': personName},
    );

    if (_responseStr is HttpError) {
      return _responseStr;
    }

    if (_responseStr == '[]') {
      return [];
    }

    return TvmazeRepositoryUtils
        .convertTvmazeSearchPeopleResponseToListOfPersonModel(_responseStr);
  }
}
