import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

// ignore: must_be_immutable
class HomeScreenPageParts extends StatelessWidget {
  HomeScreenPageParts({super.key, required this.index, required this.baseDate});

  final DateTime baseDate;
  final int index;

  DateTime dispDate = DateTime.now();

  ///
  @override
  Widget build(BuildContext context) {
    dispDate = DateTime(baseDate.year, baseDate.month, baseDate.day + index);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${dispDate.yyyymmdd}（${dispDate.youbiStr.substring(0, 3)}）'),
              Text(index.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
