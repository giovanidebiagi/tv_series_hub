import 'package:flutter/material.dart';

import '../app_theme.dart';

class ImageNotFoundWidget extends StatelessWidget {
  const ImageNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppTheme.scaffoldBackgroundColor,
      child: Center(
        child: Text('No image'),
      ),
    );
  }
}
