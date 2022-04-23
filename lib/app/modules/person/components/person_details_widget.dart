import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/person_model.dart';

class PersonDetailsWidget extends StatelessWidget {
  const PersonDetailsWidget({Key? key, required this.person}) : super(key: key);

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            person.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Country: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${person.country ?? 'Not informed'}'),
          ],
        ),
      ],
    );
  }
}
