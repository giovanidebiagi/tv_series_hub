import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';

class TvSeriesSeasonModel {
  int number;
  List<TvSeriesEpisodeModel> episodes;

  TvSeriesSeasonModel({
    required this.number,
    required this.episodes,
  });
}
