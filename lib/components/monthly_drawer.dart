import 'package:brain_log/state/app_param/app_param_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonthlyDrawer extends ConsumerWidget {
  const MonthlyDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onChanged: (value) => ref.read(appParamProvider.notifier).setSelectYear(year: value!),
    );
    //////////////////////////////////////////////

    return Drawer(
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
      child: SingleChildScrollView(
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
                      return Text(e.toString().padLeft(2, '0'));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
