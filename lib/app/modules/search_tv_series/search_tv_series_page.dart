import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';
import 'components/tv_series_search_widget/tv_series_search_widget.dart';

class SearchTvSeriesPage extends StatelessWidget {
  const SearchTvSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      pageTitle: 'Search Tv Series',
      body: TvSeriesSearchWidget(),
    );
  }
}
