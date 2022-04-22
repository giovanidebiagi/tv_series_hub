import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/modules/home/components/go_to_search_page_button.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/components/list_of_all_tv_series_by_page_widget/list_of_all_tv_series_by_page_widget.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';

import 'components/go_to_my_favorite_tv_series_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      pageTitle: 'TV Series Hub',
      body: Column(
        children: [
          GoToSearchPageButton(),
          GoToMyFavoriteTvSeriesPageButton(),
          Expanded(child: ListOfAllTvSeriesByPageWidget()),
        ],
      ),
    );
  }
}
