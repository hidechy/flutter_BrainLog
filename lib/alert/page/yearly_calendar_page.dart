import 'package:brain_log/state/app_param/app_param_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../utility/utility.dart';
import '../../viewmodel/holiday_notifier.dart';

// ignore: must_be_immutable
class YearlyCalendarPage extends ConsumerWidget {
  YearlyCalendarPage({super.key, required this.date});

  final DateTime date;

  DateTime yearFirst = DateTime.now();

  List<String> youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  List<String> days = [];

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Expanded(child: _getCalendar()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    yearFirst = DateTime(date.yyyy.toInt());

    final yearEnd = DateTime(yearFirst.year + 1, 1, 0);

    final diff = yearEnd.difference(yearFirst).inDays;
    final yearDaysNum = diff + 1;

    final youbi = yearFirst.youbiStr;
    final youbiNum = youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((yearDaysNum + youbiNum) / 7).ceil();

    days = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = yearFirst.add(Duration(days: i - youbiNum));

        if (yearFirst.year == gendate.year) {
          days[i] = gendate.mmdd;
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(getRow(days: days, rowNum: i));
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Widget getRow({required List<String> days, required int rowNum}) {
    final list = <Widget>[];

    for (var i = rowNum * 7; i < ((rowNum + 1) * 7); i++) {
      final exDays = (days[i] == '') ? <String>[] : days[i].split('-');

      list.add(
        Expanded(
          child: (days[i] == '')
              ? Container()
              : GestureDetector(
                  onTap: () async {
                    await _ref
                        .read(appParamProvider.notifier)
                        .setSelectedDate(date: DateTime(date.yyyy.toInt(), exDays[0].toInt(), exDays[1].toInt()));

                    // ignore: use_build_context_synchronously
                    Navigator.pop(_context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                      color: getBgColor(mmdd: days[i]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: _context.screenSize.height / 40),
                          child: Text(
                            (exDays[1] == '01') ? exDays[0] : days[i],
                            style: TextStyle(fontSize: (exDays[1] == '01') ? 12 : 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  ///
  Color getBgColor({required String mmdd}) {
    if (mmdd == '') {
      return Colors.transparent;
    }

    final holidayState = _ref.watch(holidayProvider);

    final exDate = mmdd.split('-');

    final genDate = DateTime(date.yyyy.toInt(), exDate[0].toInt(), exDate[1].toInt());

    return _utility.getYoubiColor(date: genDate, youbiStr: genDate.youbiStr, holiday: holidayState.data);
  }
}
