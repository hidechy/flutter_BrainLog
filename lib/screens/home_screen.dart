import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../alert/yearly_calendar_alert.dart';
import '../components/_brain_log_dialog.dart';
import '../components/monthly_drawer.dart';
import '../extensions/extensions.dart';
import '../state/app_param/app_param_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.date});

  final DateTime? date;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParamState = ref.watch(appParamProvider);

    final dispDate = (appParamState.selectDate != null)
        ? '${appParamState.selectDate!.yyyymmdd}（${appParamState.selectDate!.youbiStr.substring(0, 3)}）'
        : '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Log'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BrainLogDialog(context: context, widget: YearlyCalendarAlert());
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (dispDate != '') ...[
                Text(dispDate),
              ],
            ],
          ),
        ),
      ),
      drawer: MonthlyDrawer(),
    );
  }
}
