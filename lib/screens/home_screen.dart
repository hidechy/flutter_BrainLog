import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../alert/yearly_calendar_alert.dart';
import '../components/_brain_log_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  IconButton(
                    onPressed: () {
                      BrainLogDialog(context: context, widget: YearlyCalendarAlert());
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
