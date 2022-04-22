import 'package:flutter/material.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({
    Key? key,
    required this.pageTitle,
    required this.body,
    this.appBarActions,
  }) : super(key: key);

  final String pageTitle;
  final Widget body;
  final List<Widget>? appBarActions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: appBarActions,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}
