import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/drawer_list/drawer_list_notifier.dart';

// ignore: must_be_immutable
class MonthlyDrawer extends ConsumerWidget {
  MonthlyDrawer({super.key});

  final ScrollController _scrollControllerMonth = ScrollController();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final appParamState = ref.watch(appParamProvider);

    //================================//
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (appParamState.selectYear == 0 || appParamState.selectMonth == 0) {
        ref.read(appParamProvider.notifier).setSelectYear(year: DateTime.now().year);

        ref.read(appParamProvider.notifier).setSelectMonth(month: DateTime.now().month);

        ref
            .read(drawerListProvider.notifier)
            .makeDrawerDateList(year: DateTime.now().year, month: DateTime.now().month);
      }

      if (appParamState.selectMonth > 6) {
        _scrollControllerMonth.jumpTo(_scrollControllerMonth.position.maxScrollExtent);
      }
    });
    //================================//

    //////////////////////////////////////////////
    final drawerYears = <int>[];
    for (var i = 1973; i <= DateTime.now().year + 10; i++) {
      drawerYears.add(i);
    }

    final drawerYearDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: drawerYears.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.toString(), style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
      value: (appParamState.selectYear == 0) ? DateTime.now().year : appParamState.selectYear,
      onChanged: (value) {
        ref.read(appParamProvider.notifier).setSelectMonth(month: 0);
        ref.read(appParamProvider.notifier).setSelectYear(year: value!);
      },
    );
    //////////////////////////////////////////////

    return Drawer(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.yellowAccent.withOpacity(0.5),
              width: 5,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              drawerYearDropDown,
              SingleChildScrollView(
                controller: _scrollControllerMonth,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(12, (index) => index + 1).map((e) {
                    return Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: (appParamState.selectMonth == e) ? Colors.yellowAccent : Colors.white.withOpacity(0.4),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ref.read(appParamProvider.notifier).setSelectMonth(month: e);

                          ref.read(drawerListProvider.notifier).makeDrawerDateList(
                                year: (appParamState.selectYear == 0) ? DateTime.now().year : appParamState.selectYear,
                                month: e,
                              );
                        },
                        child: Text(
                          e.toString().padLeft(2, '0'),
                          style:
                              TextStyle(color: (appParamState.selectMonth == e) ? Colors.yellowAccent : Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              const SizedBox(height: 10),
              Expanded(child: _displayDrawerDateList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayDrawerDateList() {
    final list = <Widget>[];

    _ref.watch(drawerListProvider.select((value) => value.drawerDateList)).forEach((element) {
      final dispDay = '${element.day.toString().padLeft(2, '0')}（${element.youbiStr.substring(0, 3)}）';

      list.add(Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          color:
              (element.yyyymmdd == DateTime.now().yyyymmdd) ? Colors.yellowAccent.withOpacity(0.1) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dispDay),
            Container(),
          ],
        ),
      ));
    });

    return SingleChildScrollView(child: Column(children: list));
  }
}
