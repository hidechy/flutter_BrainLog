import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  factory AppParamState({int? selectYear, int? selectMonth, DateTime? selectDate}) = _AppParamState;
}
