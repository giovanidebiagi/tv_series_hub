import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_hub/app/data/models/tv_series_model.dart';

import '../../../shared/controllers/favorite_tv_series_controller.dart';

class SetAsFavoriteButton extends StatelessWidget {
  const SetAsFavoriteButton({Key? key, required this.tvSeries})
      : super(key: key);

  final TvSeriesModel tvSeries;

  @override
  Widget build(BuildContext context) {
    final _favoriteTvSeriesController =
        Provider.of<FavoriteTvSeriesController>(context, listen: false);

    return InkWell(
      onTap: () async {
        await _favoriteTvSeriesController.toggleFavorite(tvSeries: tvSeries);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<FavoriteTvSeriesController>(
          builder: (context, favoriteTvSeriesController, child) => Icon(
            Icons.star,
            color: tvSeries.isFavorite! ? Colors.yellow : Colors.white,
          ),
        ),
      ),
    );
  }
}
