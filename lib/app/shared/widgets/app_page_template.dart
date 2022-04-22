import 'package:flutter/material.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({
    Key? key,
    required this.pageTitle,
    required this.body,
  }) : super(key: key);

  final String pageTitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}
