import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/modules/my_favorite_tv_series/components/list_of_favorite_tv_series/list_of_favorite_tv_series_widget.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';

class MyFavoriteTvSeriesPage extends StatelessWidget {
  const MyFavoriteTvSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      pageTitle: 'Favorite Tv Series',
      body: ListOfFavoriteTvSeriesWidget(),
    );
  }
}
