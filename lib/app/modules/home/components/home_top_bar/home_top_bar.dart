import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/modules/home/components/home_top_bar/components/home_top_bar_button.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';

import '../../../../shared/routes.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: HomeTopBarButton(
              iconData: Icons.search,
              buttonLabel: 'Search for Tv Series',
              routeName: Routes.searchPage,
            ),
          ),
          VerticalDivider(
            color: AppTheme.secondaryColor,
          ),
          Flexible(
            child: HomeTopBarButton(
              iconData: Icons.star,
              buttonLabel: 'Favorite Tv Series',
              routeName: Routes.myFavoriteTvSeriesPage,
            ),
          ),
          VerticalDivider(
            color: AppTheme.secondaryColor,
          ),
          Flexible(
            child: HomeTopBarButton(
              iconData: Icons.person_search,
              buttonLabel: 'Search for People',
              routeName: '',
            ),
          ),
        ],
      ),
    );
  }
}
