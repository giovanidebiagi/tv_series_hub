import 'package:flutter/material.dart';
import 'components/found_people_list_widget/found_people_list_widget.dart';
import 'components/people_search_bar.dart';

class PeopleSearchWidget extends StatelessWidget {
  const PeopleSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PeopleSearchBar(),
        SizedBox(height: 32.0),
        Expanded(
          child: FoundPeopleListWidget(),
        ),
      ],
    );
  }
}
