import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/data/repositories/local_storage_repositories/i_local_storage_repository.dart';
import 'package:tv_series_hub/app/data/repositories/tv_series_data_source_repositories/tvmaze_repository/tvmaze_repository.dart';
import 'package:tv_series_hub/app/modules/episode/episode_page.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/list_of_all_tv_series_by_page_controller.dart';
import 'package:tv_series_hub/app/modules/my_favorite_tv_series/my_favorite_tv_series_page.dart';
import 'package:tv_series_hub/app/modules/person/person_page.dart';
import 'package:tv_series_hub/app/modules/search_people/components/people_search_widget/people_search_controller.dart';
import 'package:tv_series_hub/app/modules/search_people/search_people_page.dart';
import 'package:tv_series_hub/app/modules/search_tv_series/search_tv_series_page.dart';
import 'package:tv_series_hub/app/modules/tv_series/components/tv_series_list_of_episodes_by_season/tv_series_list_of_episodes_by_season_controller.dart';
import 'package:tv_series_hub/app/modules/tv_series/tv_series_page.dart';
import 'package:tv_series_hub/app/services/http_services/dio_service.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import 'package:tv_series_hub/app/shared/controllers/favorite_tv_series_controller.dart';
import 'package:tv_series_hub/app/shared/routes.dart';
import 'modules/home/home_page.dart';
import 'modules/person/components/person_list_of_tv_series/person_list_of_tv_series_controller.dart';
import 'modules/search_tv_series/components/tv_series_search_widget/tv_series_search_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key, required this.iLocalStorageRepository})
      : super(key: key);

  final ILocalStorageRepository iLocalStorageRepository;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void dispose() {
    widget.iLocalStorageRepository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ILocalStorageRepository>(
            create: (_) => widget.iLocalStorageRepository),
        ChangeNotifierProvider<ListOfAllTvSeriesByPageController>(
          create: (_) => ListOfAllTvSeriesByPageController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
            iLocalStorageRepository: widget.iLocalStorageRepository,
          ),
        ),
        ChangeNotifierProvider<TvSeriesSearchController>(
          create: (_) => TvSeriesSearchController(
              iTvSeriesDataSourceRepository: TvmazeRepository(
                httpService: DioService(),
              ),
              iLocalStorageRepository: widget.iLocalStorageRepository),
        ),
        ChangeNotifierProvider<TvSeriesListOfEpisodesBySeasonController>(
          create: (_) => TvSeriesListOfEpisodesBySeasonController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
          ),
        ),
        ChangeNotifierProvider<FavoriteTvSeriesController>(
          create: (_) => FavoriteTvSeriesController(
            iLocalStorageRepository: widget.iLocalStorageRepository,
          ),
        ),
        ChangeNotifierProvider<PeopleSearchController>(
          create: (_) => PeopleSearchController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
          ),
        ),
        ChangeNotifierProvider<PersonListOfTvSeriesController>(
          create: (_) => PersonListOfTvSeriesController(
            iTvSeriesDataSourceRepository: TvmazeRepository(
              httpService: DioService(),
            ),
            iLocalStorageRepository: widget.iLocalStorageRepository,
          ),
        ),
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
          Routes.searchTvSeriesPage: (context) => const SearchTvSeriesPage(),
          Routes.tvSeriesPage: (context) => const TvSeriesPage(),
          Routes.episodePage: (context) => const EpisodePage(),
          Routes.myFavoriteTvSeriesPage: (context) =>
              const MyFavoriteTvSeriesPage(),
          Routes.searchPeoplePage: (context) => const SearchPeoplePage(),
          Routes.personPage: (context) => const PersonPage(),
        },
      ),
    );
  }
}
