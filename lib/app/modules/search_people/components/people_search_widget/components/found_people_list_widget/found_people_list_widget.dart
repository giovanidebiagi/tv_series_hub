import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';

import '../../people_search_controller.dart';
import 'components/found_person_card.dart';

class FoundPeopleListWidget extends StatelessWidget {
  const FoundPeopleListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PeopleSearchController>(
      builder: ((context, peopleSearchController, child) {
        if (peopleSearchController.isSearching) {
          return const Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: const Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        if (peopleSearchController.foundPeople is HttpNotFoundError) {
          return const Text(
              'Oops! It seems data could not be retrieved from the servers. This could be temporary. Please try agina in a few moments.');
        } else if (peopleSearchController.foundPeople is HttpCustomError) {
          return const Text('Please try again in a few moments.');
        } else if (peopleSearchController.foundPeople is FormatException) {
          return const Text(
              'Oops! It seems the data retrieved by the servers is broken. This could be temporary. Please try again in a few moments.');
        } else if (peopleSearchController.foundPeople is List &&
            peopleSearchController.foundPeople.isEmpty) {
          return const Text(
              'Sorry, we could not find the TV Series you are looking for');
        } else if (peopleSearchController.foundPeople == null) {
          return const SizedBox();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: peopleSearchController.foundPeople.length,
          itemBuilder: (context, index) {
            return FoundPersonCard(
                person: peopleSearchController.foundPeople[index]);
          },
        );
      }),
    );
  }
}
