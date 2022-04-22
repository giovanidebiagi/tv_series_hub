import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_episode_model.dart';

class EpisodeDetailsWidget extends StatelessWidget {
  const EpisodeDetailsWidget({Key? key, required this.tvSeriesEpisode})
      : super(key: key);

  final TvSeriesEpisodeModel tvSeriesEpisode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            tvSeriesEpisode.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Episode number: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${tvSeriesEpisode.number}'),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Season: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${tvSeriesEpisode.season}'),
          ],
        ),
      ],
    );
  }
}
