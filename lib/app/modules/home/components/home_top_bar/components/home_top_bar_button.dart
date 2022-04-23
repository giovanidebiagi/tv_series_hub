import 'package:flutter/material.dart';
import 'package:tv_series_hub/app/shared/app_theme.dart';

class HomeTopBarButton extends StatelessWidget {
  const HomeTopBarButton(
      {Key? key,
      required this.iconData,
      required this.buttonLabel,
      required this.routeName})
      : super(key: key);

  final IconData iconData;
  final String buttonLabel;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: AppTheme.defaultTextColor),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                buttonLabel,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.defaultTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
