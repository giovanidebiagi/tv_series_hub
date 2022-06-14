import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/shared/widgets/app_page_template.dart';
import 'components/people_search_widget/people_search_widget.dart';

class SearchPeoplePage extends StatelessWidget {
  const SearchPeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      pageTitle: 'Search People',
      body: PeopleSearchWidget(),
    );
  }
}
