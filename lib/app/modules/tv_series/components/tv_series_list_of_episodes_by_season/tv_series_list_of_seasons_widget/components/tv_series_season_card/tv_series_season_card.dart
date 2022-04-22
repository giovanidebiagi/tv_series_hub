import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_season_model.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_seasons_widget/components/tv_series_season_card/components/tv_series_episode_card.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';

class TvSeriesSeasonCard extends StatelessWidget {
  const TvSeriesSeasonCard({Key? key, required this.tvSeriesSeason})
      : super(key: key);

  final TvSeriesSeasonModel tvSeriesSeason;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryColor,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
        ),
        child: ExpansionTile(
          title: Text(
            'Season ${tvSeriesSeason.number}',
          ),
          children: tvSeriesSeason.episodes
              .map((e) => TvSeriesEpisodeCard(tvSeriesEpisode: e))
              .toList(),
        ),
      ),
    );
  }
}
