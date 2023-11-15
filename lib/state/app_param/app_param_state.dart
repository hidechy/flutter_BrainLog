import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  factory AppParamState({
    @Default(0) int selectYear,
    @Default(0) int selectMonth,
    DateTime? selectDate,
  }) = _AppParamState;
}
