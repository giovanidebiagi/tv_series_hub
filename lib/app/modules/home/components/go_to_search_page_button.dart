import 'package:flutter/material.dart';
import '../../../shared/routes.dart';

class GoToSearchPageButton extends StatelessWidget {
  const GoToSearchPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, Routes.searchPage);
      },
      icon: const Icon(Icons.search),
      label: const Text('Search TV Series'),
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
