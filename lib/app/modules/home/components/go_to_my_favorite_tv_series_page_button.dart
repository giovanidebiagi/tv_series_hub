import 'package:flutter/material.dart';
import '../../../shared/routes.dart';

class GoToMyFavoriteTvSeriesPageButton extends StatelessWidget {
  const GoToMyFavoriteTvSeriesPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, Routes.myFavoriteTvSeriesPage);
      },
      icon: const Icon(Icons.star),
      label: const Text('My Favorite Tv Series'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
