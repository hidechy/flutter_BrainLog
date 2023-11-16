// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    DateTime? selectedDate,
  }) = _AppParamState;
}
