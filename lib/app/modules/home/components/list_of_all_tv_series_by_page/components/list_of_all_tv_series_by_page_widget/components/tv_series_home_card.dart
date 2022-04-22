import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import 'package:tv_series_hub/app/shared/routes.dart';
import 'package:tv_series_hub/app/shared/widgets/image_not_found_widget.dart';

class TvSeriesHomeCard extends StatelessWidget {
  const TvSeriesHomeCard({
    Key? key,
    required this.tvSeries,
  }) : super(key: key);

  final TvSeriesModel tvSeries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.tvSeriesPage,
            arguments: tvSeries,
          );
        },
        child: Card(
          child: Row(
            children: [
              tvSeries.imageUrl != null
                  ? Image.network(
                      tvSeries.imageUrl!,
                    )
                  : ImageNotFoundWidget(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          tvSeries.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.secondaryTextColor,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Rating: ${tvSeries.rating ?? 'Not informed'}',
                          style: TextStyle(
                              fontSize: 16, color: AppTheme.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
