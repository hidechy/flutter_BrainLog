import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../state/article/article_notifier.dart';

// ignore: must_be_immutable
class HomeScreenPageParts extends ConsumerWidget {
  HomeScreenPageParts({super.key, required this.index, required this.baseDate});

  final DateTime baseDate;
  final int index;

  DateTime dispDate = DateTime.now();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

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
          Expanded(child: _displayArticle()),
        ],
      ),
    );
  }

  ///
  Widget _displayArticle() {
    final list = <Widget>[];

    _ref.watch(articleProvider(dispDate).select((value) => value.articleList)).forEach((element) {
      list.add(
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            element.article,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    });

    return SingleChildScrollView(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      ),
    );
  }
}
