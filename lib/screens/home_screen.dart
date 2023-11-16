import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../alert/page/home_screen_page_parts.dart';
import '../alert/yearly_calendar_alert.dart';
import '../components/_brain_log_dialog.dart';
import '../state/app_param/app_param_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  var _currentIndex = 0;

  int tabsNum = 13;

  late final TabController tabController = TabController(length: tabsNum, vsync: this);

  ///
  @override
  void initState() {
    super.initState();

    tabController
      ..addListener(() => setState(() => _currentIndex = tabController.index))
      ..index = (tabsNum / 2).floor();
  }

  ///
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    final appParamState = ref.watch(appParamProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    GestureDetector(
                      onTap: () {
                        BrainLogDialog(context: context, widget: YearlyCalendarAlert());
                      },
                      child: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                (appParamState.selectedDate == null)
                    ? Container()
                    : Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: List.generate(
                            tabsNum,
                            (index) => HomeScreenPageParts(
                              baseDate: appParamState.selectedDate!,
                              index: _currentIndex - ((tabsNum / 2).floor()),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
