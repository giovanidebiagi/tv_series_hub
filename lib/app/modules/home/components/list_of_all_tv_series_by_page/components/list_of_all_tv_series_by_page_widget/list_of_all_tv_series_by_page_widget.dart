import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/components/list_of_all_tv_series_by_page_widget/components/tv_series_home_card.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/components/list_of_all_tv_series_by_page_widget/components/tv_series_page_navigation_widget/tv_series_page_navigation_widget.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';
import '../../list_of_all_tv_series_by_page_controller.dart';

class ListOfAllTvSeriesByPageWidget extends StatefulWidget {
  const ListOfAllTvSeriesByPageWidget({Key? key}) : super(key: key);

  @override
  State<ListOfAllTvSeriesByPageWidget> createState() =>
      _ListOfAllTvSeriesByPageWidgetState();
}

class _ListOfAllTvSeriesByPageWidgetState
    extends State<ListOfAllTvSeriesByPageWidget> {
  Future? _getListOfAllTvSeriesByPage;

  @override
  void initState() {
    _getListOfAllTvSeriesByPage =
        Provider.of<ListOfAllTvSeriesByPageController>(context, listen: false)
            .fetchAllTvSeriesByPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListOfAllTvSeriesByPageController>(
      builder: (context, listOfAllTvSeriesByPageController, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('All series'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
              child:
                  listOfAllTvSeriesByPageController.isFetchingAllTvSeriesByPage
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: const Text(
                              'Loading...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : FutureBuilder(
                          future: _getListOfAllTvSeriesByPage,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 32.0),
                                child: const Text(
                                  'Loading...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ));
                            } else if (listOfAllTvSeriesByPageController
                                .listOfAllTvSeriesByPage is HttpNotFoundError) {
                              return const Text(
                                  'Oops! It seems data could not be retrieved from the servers. This could be temporary. Please try agina in a few moments.');
                            } else if (listOfAllTvSeriesByPageController
                                .listOfAllTvSeriesByPage is HttpCustomError) {
                              return const Text(
                                  'Please try again in a few moments.');
                            } else if (listOfAllTvSeriesByPageController
                                .listOfAllTvSeriesByPage is FormatException) {
                              return const Text(
                                  'Oops! It seems the data retrieved by the servers is broken. This could be temporary. Please try again in a few moments.');
                            }

                            return ListView.builder(
                              itemCount: listOfAllTvSeriesByPageController
                                  .listOfAllTvSeriesByPage.length,
                              itemBuilder: (context, index) {
                                return TvSeriesHomeCard(
                                    tvSeries: listOfAllTvSeriesByPageController
                                        .listOfAllTvSeriesByPage[index]);
                              },
                            );
                          },
                        ),
            ),
            SizedBox(height: 16.0),
            const TvSeriesPageNavigationWidget(),
          ],
        );
      },
    );
  }
}
