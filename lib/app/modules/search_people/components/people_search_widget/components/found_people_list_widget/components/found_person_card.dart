import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/data/models/person_model.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';
import 'package:tv_series_hub/app/shared/widgets/image_not_found_widget.dart';

import '../../../../../../../shared/routes.dart';

class FoundPersonCard extends StatelessWidget {
  const FoundPersonCard({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.personPage,
            arguments: person,
          );
        },
        child: Card(
          child: Row(
            children: [
              person.imageUrl != null
                  ? Image.network(
                      person.imageUrl!,
                    )
                  : ImageNotFoundWidget(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          person.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.secondaryTextColor,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Country: ${person.country ?? 'Not informed'}',
                          style: TextStyle(
                              fontSize: 16, color: AppTheme.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
