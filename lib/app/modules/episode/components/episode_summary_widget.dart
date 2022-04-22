import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EpisodeSummaryWidget extends StatelessWidget {
  const EpisodeSummaryWidget({Key? key, required this.summary})
      : super(key: key);

  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Summary: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Html(data: """
${summary}
""")
      ],
    );
  }
}
