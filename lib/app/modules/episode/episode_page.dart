import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';
import 'package:tv_series_hub/app/modules/episode/components/episode_details_widget.dart';
import 'package:tv_series_hub/app/modules/episode/components/episode_summary_widget.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TvSeriesEpisodeModel tvSeriesEpisode =
        ModalRoute.of(context)!.settings.arguments as TvSeriesEpisodeModel;

    return AppPageTemplate(
      pageTitle: tvSeriesEpisode.name,
      body: SingleChildScrollView(
        child: Column(
          children: [
            tvSeriesEpisode.imageUrl != null
                ? Image.network(tvSeriesEpisode.imageUrl!)
                : const SizedBox.shrink(),
            SizedBox(height: 32.0),
            EpisodeDetailsWidget(tvSeriesEpisode: tvSeriesEpisode),
            SizedBox(height: 24.0),
            tvSeriesEpisode.summary != null
                ? EpisodeSummaryWidget(summary: tvSeriesEpisode.summary!)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
