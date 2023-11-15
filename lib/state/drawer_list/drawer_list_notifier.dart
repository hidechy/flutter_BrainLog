import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'drawer_list_state.dart';

////////////////////////////////////////////////
final drawerListProvider = StateNotifierProvider.autoDispose<DrawerListNotifier, DrawerListState>((ref) {
  return DrawerListNotifier(const DrawerListState());
});

class DrawerListNotifier extends StateNotifier<DrawerListState> {
  DrawerListNotifier(super.state);

  ///
  Future<void> makeDrawerDateList({required int year, required int month}) async {
    final nextMonthFirstDate = DateTime(year, month + 1);

    final thisMonthLastYear =
        DateTime(nextMonthFirstDate.year, nextMonthFirstDate.month, nextMonthFirstDate.day - 1).year;

    final thisMonthLastMonth =
        DateTime(nextMonthFirstDate.year, nextMonthFirstDate.month, nextMonthFirstDate.day - 1).month;

    final thisMonthLastDay =
        DateTime(nextMonthFirstDate.year, nextMonthFirstDate.month, nextMonthFirstDate.day - 1).day;

    final list = <DateTime>[];
    for (var i = 1; i <= thisMonthLastDay; i++) {
      list.add(DateTime(thisMonthLastYear, thisMonthLastMonth, i));
    }

    state = state.copyWith(drawerDateList: list);
  }
}
////////////////////////////////////////////////
