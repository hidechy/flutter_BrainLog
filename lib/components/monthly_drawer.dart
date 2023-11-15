import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/app_param/app_param_notifier.dart';
import '../state/drawer_list/drawer_list_notifier.dart';

// ignore: must_be_immutable
class MonthlyDrawer extends ConsumerWidget {
  MonthlyDrawer({super.key});

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    // Future(() => ref.watch(appParamProvider.notifier).setSelectYear(year: DateTime.now().year));
    // Future(() => ref.watch(appParamProvider.notifier).setSelectMonth(month: DateTime.now().month));
    // Future(
    //   () => ref.watch(drawerListProvider.notifier).makeDrawerDateList(
    //         year: DateTime.now().year,
    //         month: DateTime.now().month,
    //       ),
    // );

    final appParamState = ref.watch(appParamProvider);

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
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
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
              const SizedBox(height: 70),
              drawerYearDropDown,
              SingleChildScrollView(
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
      list.add(Text(element.day.toString().padLeft(2, '0')));
    });

    return SingleChildScrollView(child: Column(children: list));
  }
}
