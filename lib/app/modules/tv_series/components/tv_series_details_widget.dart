import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';

class TvSeriesDetailsWidget extends StatelessWidget {
  const TvSeriesDetailsWidget({Key? key, required this.tvSeries})
      : super(key: key);

  final TvSeriesModel tvSeries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            tvSeries.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${tvSeries.timeItAirs ?? 'Not informed'}'),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Days: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: Text(
                  '${tvSeries.daysItAirs != null ? tvSeries.daysItAirs!.join(", ") : null}'),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Genres: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Flexible(child: Text('${tvSeries.genres.join(", ")}')),
          ],
        ),
      ],
    );
  }
}
