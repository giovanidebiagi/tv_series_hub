import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/modules/home/components/home_top_bar/home_top_bar.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/components/list_of_all_tv_series_by_page_widget/list_of_all_tv_series_by_page_widget.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      pageTitle: 'TV Series Hub',
      body: Column(
        children: [
          HomeTopBar(),
          SizedBox(height: 8.0),
          Expanded(child: ListOfAllTvSeriesByPageWidget()),
        ],
      ),
    );
  }
}
