import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import 'package:tv_series_hub/app/shared/widgets/image_not_found_widget.dart';

import '../../../../../../../../shared/routes.dart';

class TvSeriesEpisodeCard extends StatelessWidget {
  const TvSeriesEpisodeCard({Key? key, required this.tvSeriesEpisode})
      : super(key: key);

  final TvSeriesEpisodeModel tvSeriesEpisode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.episodePage,
          arguments: tvSeriesEpisode,
        );
      },
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 96,
              child: tvSeriesEpisode.imageUrl != null
                  ? Image.network(
                      tvSeriesEpisode.imageUrl!,
                    )
                  : ImageNotFoundWidget(),
            ),
            const SizedBox(width: 16.0),
            Flexible(
                child: Text(
              tvSeriesEpisode.name,
              style: TextStyle(
                color: AppTheme.secondaryTextColor,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
