import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_param_state.dart';

////////////////////////////////////////////////
final appParamProvider = StateNotifierProvider.autoDispose<AppParamNotifier, AppParamState>((ref) {
  return AppParamNotifier(const AppParamState());
});

class AppParamNotifier extends StateNotifier<AppParamState> {
  AppParamNotifier(super.state);

  ///
  Future<void> setSelectYear({required int year}) async => state = state.copyWith(selectYear: year);

  ///
  Future<void> setSelectMonth({required int month}) async => state = state.copyWith(selectMonth: month);
}

////////////////////////////////////////////////
