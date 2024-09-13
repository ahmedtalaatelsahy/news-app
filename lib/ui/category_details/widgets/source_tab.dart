import 'package:flutter/material.dart';

import '../../../model/sources_response/Source.dart';

class SourceTabWidget extends StatelessWidget {
  final Source source;
  const SourceTabWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(source.name ?? ""),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
