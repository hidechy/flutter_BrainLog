import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/monthly_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Column(
          children: [
            Text('HomeScreen'),
          ],
        ),
      ),
      drawer: const MonthlyDrawer(),
    );
  }
}
