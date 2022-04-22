import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/data/repositories/tvmaze_repository/tvmaze_repository.dart';
import 'package:tv_series_hub/app/modules/episode/episode_page.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/list_of_all_tv_series_by_page_controller.dart';
import 'package:tv_series_hub/app/modules/search/search_page.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_episodes_by_season_controller.dart';
import 'package:tv_series_hub/app/modules/tv_series/tv_series_page.dart';
import 'package:tv_series_hub/app/services/http_services/dio_service.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import 'package:tv_series_hub/app/shared/routes.dart';
import 'modules/home/home_page.dart';
import 'modules/search/components/tv_series_search_widget/tv_series_search_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListOfAllTvSeriesByPageController>(
          create: (_) => ListOfAllTvSeriesByPageController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
          ),
        ),
        ChangeNotifierProvider<TvSeriesSearchController>(
          create: (_) => TvSeriesSearchController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
          ),
        ),
        ChangeNotifierProvider<TvSeriesListOfEpisodesBySeasonController>(
          create: (_) => TvSeriesListOfEpisodesBySeasonController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'TV Series Hub',
        theme: ThemeData(
          // brightness: Brightness.dark,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppTheme.defaultTextColor,
                fontSizeFactor: 1.1,
                fontSizeDelta: 2.0,
              ),
          scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
          appBarTheme:
              AppBarTheme(backgroundColor: AppTheme.appBarBackgroundColor),
        ),
        initialRoute: Routes.homePage,
        routes: {
          Routes.homePage: (context) => const HomePage(),
          Routes.searchPage: (context) => const SearchPage(),
          Routes.tvSeriesPage: (context) => const TvSeriesPage(),
          Routes.episodePage: (context) => const EpisodePage()
        },
      ),
    );
  }
}
