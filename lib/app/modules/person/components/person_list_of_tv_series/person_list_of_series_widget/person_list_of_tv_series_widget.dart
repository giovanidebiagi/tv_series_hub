import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/modules/home/components/list_of_all_tv_series_by_page/components/list_of_all_tv_series_by_page_widget/components/tv_series_home_card.dart';
import 'package:tv_series_hub/app/modules/person/components/person_list_of_tv_series/person_list_of_tv_series_controller.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';

class PersonListOfTvSeriesWidget extends StatefulWidget {
  const PersonListOfTvSeriesWidget({Key? key, required this.personId})
      : super(key: key);

  final int personId;

  @override
  State<PersonListOfTvSeriesWidget> createState() =>
      _PersonListOfTvSeriesWidgetState();
}

class _PersonListOfTvSeriesWidgetState
    extends State<PersonListOfTvSeriesWidget> {
  Future? _getListOfAllTvSeriesByPage;

  @override
  void initState() {
    _getListOfAllTvSeriesByPage =
        Provider.of<PersonListOfTvSeriesController>(context, listen: false)
            .fetchPersonListOfTvSeries(personId: widget.personId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final personListOfTvSeriesController =
        Provider.of<PersonListOfTvSeriesController>(context, listen: false);

    return FutureBuilder(
      future: _getListOfAllTvSeriesByPage,
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
        } else if (personListOfTvSeriesController.listOfPersonTvSeries
            is HttpNotFoundError) {
          return const Text(
              'Oops! It seems data could not be retrieved from the servers. This could be temporary. Please try agina in a few moments.');
        } else if (personListOfTvSeriesController.listOfPersonTvSeries
            is HttpCustomError) {
          return const Text('Please try again in a few moments.');
        } else if (personListOfTvSeriesController.listOfPersonTvSeries
            is FormatException) {
          return const Text(
              'Oops! It seems the data retrieved by the servers is broken. This could be temporary. Please try again in a few moments.');
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: personListOfTvSeriesController.listOfPersonTvSeries.length,
          itemBuilder: (context, index) {
            return TvSeriesHomeCard(
                tvSeries:
                    personListOfTvSeriesController.listOfPersonTvSeries[index]);
          },
        );
      },
    );
  }
}
