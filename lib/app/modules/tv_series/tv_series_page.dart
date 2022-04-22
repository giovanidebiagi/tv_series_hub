import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_details_widget.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_seasons_widget/tv_series_list_of_seasons_widget.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_summary_widget.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';
import 'package:tv_series_hub/app/shared/widgets/image_not_found_widget.dart';

class TvSeriesPage extends StatelessWidget {
  const TvSeriesPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final TvSeriesModel tvSeries =
        ModalRoute.of(context)!.settings.arguments as TvSeriesModel;

    return AppPageTemplate(
      pageTitle: tvSeries.name,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 177,
                  width: 126,
                  child: tvSeries.imageUrl != null
                      ? Image.network(tvSeries.imageUrl!)
                      : ImageNotFoundWidget(),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TvSeriesDetailsWidget(tvSeries: tvSeries),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            tvSeries.summary != null
                ? TvSeriesSummaryWidget(summary: tvSeries.summary!)
                : SizedBox.shrink(),
            SizedBox(height: 16.0),
            TvSeriesListOfSeasonsWidget(
              tvSeriesId: tvSeries.id,
            ),
          ],
        ),
      ),
    );
  }
}
