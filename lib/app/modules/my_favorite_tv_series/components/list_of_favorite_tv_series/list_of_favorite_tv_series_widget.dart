import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/controllers/favorite_tv_series_controller.dart';
import 'components/favorite_tv_series_card.dart';

class ListOfFavoriteTvSeriesWidget extends StatefulWidget {
  const ListOfFavoriteTvSeriesWidget({Key? key}) : super(key: key);

  @override
  State<ListOfFavoriteTvSeriesWidget> createState() =>
      _ListOfFavoriteTvSeriesWidgetState();
}

class _ListOfFavoriteTvSeriesWidgetState
    extends State<ListOfFavoriteTvSeriesWidget> {
  late Future getListOfFavoriteTvSeries;

  @override
  void initState() {
    getListOfFavoriteTvSeries =
        Provider.of<FavoriteTvSeriesController>(context, listen: false)
            .createListOfFavoriteTvSeries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteTvSeriesController>(
      builder: (context, favoriteTvSeriesController, child) {
        return FutureBuilder(
          future: getListOfFavoriteTvSeries,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: const Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
              ));
            } else if (favoriteTvSeriesController
                .listOfFavoriteTvSeries.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: const Text(
                    'You currently do not have any favorite Tv Series.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount:
                  favoriteTvSeriesController.listOfFavoriteTvSeries.length,
              itemBuilder: (context, index) {
                return FavoriteTvSeriesCard(
                    tvSeries: favoriteTvSeriesController
                        .listOfFavoriteTvSeries[index]);
              },
            );
          },
        );
      },
    );
  }
}
