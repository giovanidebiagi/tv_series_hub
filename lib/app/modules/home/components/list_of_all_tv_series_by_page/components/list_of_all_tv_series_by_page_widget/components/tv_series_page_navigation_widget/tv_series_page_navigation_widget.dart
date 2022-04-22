import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';

import '../../../../list_of_all_tv_series_by_page_controller.dart';

class TvSeriesPageNavigationWidget extends StatelessWidget {
  const TvSeriesPageNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listOfAllTvSeriesByPageController =
        Provider.of<ListOfAllTvSeriesByPageController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _listOfAllTvSeriesByPageController.goToPreviousPage();
          },
          child: Icon(Icons.arrow_left,
              size: 64, color: AppTheme.defaultTextColor),
        ),
        Consumer<ListOfAllTvSeriesByPageController>(
            builder: (context, controller, child) {
          return Text('Page ${controller.currentPage + 1}');
        }),
        InkWell(
          onTap: () {
            _listOfAllTvSeriesByPageController.goToNextPage();
          },
          child: Icon(
            Icons.arrow_right,
            size: 64,
            color: AppTheme.defaultTextColor,
          ),
        )
      ],
    );
  }
}
