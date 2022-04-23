import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';
import 'package:tv_series_hub/app/shared/widgets/image_not_found_widget.dart';
import '../../data/models/person_model.dart';
import 'components/person_details_widget.dart';
import 'components/person_list_of_tv_series/person_list_of_series_widget/person_list_of_tv_series_widget.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final PersonModel person =
        ModalRoute.of(context)!.settings.arguments as PersonModel;

    return AppPageTemplate(
      pageTitle: person.name,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 177,
                  width: 126,
                  child: person.imageUrl != null
                      ? Image.network(person.imageUrl!)
                      : ImageNotFoundWidget(),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: PersonDetailsWidget(person: person),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            Text('Casting in'),
            SizedBox(height: 16),
            PersonListOfTvSeriesWidget(
              personId: person.id,
            ),
          ],
        ),
      ),
    );
  }
}
