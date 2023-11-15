import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonthlyDrawer extends ConsumerWidget {
  const MonthlyDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final drawerYears = <int>[];
    for (var i = 1973; i <= DateTime.now().year + 10; i++) {
      drawerYears.add(i);
    }

    ///
    final drawerYearDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: drawerYears.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.toString(), style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
      // value: mapPinpointState.pinpointMapZoom,
      // onChanged: (value) async => _ref.watch(mapPinpointProvider.notifier).setPinpointMapZoom(zoom: value!),
      //
      //

      value: DateTime.now().year,
      onChanged: (value) async {},
    );

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
