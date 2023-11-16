import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/app_param/app_param_notifier.dart';
import 'page/yearly_calendar_page.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

// ignore: must_be_immutable
class YearlyCalendarAlert extends HookConsumerWidget {
  YearlyCalendarAlert({super.key});

  List<TabInfo> tabs = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    makeTab();

    final tabController = useTabController(initialLength: tabs.length);

    //========================================= 最初に開くタブを指定する

    // ignore: cascade_invocations
    tabController.index = 1;

    //カレンダーで日付が指定されている場合
    final selectedDate = ref.watch(appParamProvider.select((value) => value.selectedDate));
    if (selectedDate != null) {
      final selectedYear = selectedDate.year;
      final lastYear = DateTime.now().year + 1;
      tabController.index = lastYear - selectedYear;
    }
    //========================================= 最初に開くタブを指定する

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //-------------------------//これを消すと「←」が出てくる（消さない）
            leading: const Icon(
              Icons.check_box_outline_blank,
              color: Colors.transparent,
            ),
            //-------------------------//これを消すと「←」が出てくる（消さない）

            bottom: TabBar(
              //================================//
              controller: tabController,
              //================================//

              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
            ),
          ),
        ),
        body: TabBarView(
          //================================//
          controller: tabController,
          //================================//

          children: tabs.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }

  ///
  void makeTab() {
    tabs = [];

    final list = <int>[];

    for (var i = 1973; i <= DateTime.now().year + 1; i++) {
      list.add(i);
    }

    list
      ..sort((a, b) => -1 * a.compareTo(b))
      ..forEach((element) {
        tabs.add(
          TabInfo(
            element.toString(),
            YearlyCalendarPage(date: DateTime(element)),
          ),
        );
      });
  }
}
