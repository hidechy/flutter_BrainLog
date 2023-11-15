import 'package:brain_log/extensions/extensions.dart';
import 'package:brain_log/state/app_param/app_param_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/monthly_drawer.dart';

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
      appBar: AppBar(),
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
