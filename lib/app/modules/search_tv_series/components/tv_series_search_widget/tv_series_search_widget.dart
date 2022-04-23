import 'package:flutter/material.dart';
import 'components/found_tv_series_list_widget/found_tv_series_list_widget.dart';
import 'components/tv_series_search_bar.dart';

class TvSeriesSearchWidget extends StatelessWidget {
  const TvSeriesSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TvSeriesSearchBar(),
        SizedBox(height: 32.0),
        Expanded(
          child: FoundTvSeriesListWidget(),
        ),
      ],
    );
  }
}
