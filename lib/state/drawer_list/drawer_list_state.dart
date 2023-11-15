import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_list_state.freezed.dart';

@freezed
class DrawerListState with _$DrawerListState {
  const factory DrawerListState({
    @Default([]) List<DateTime> drawerDateList,
  }) = _DrawerListState;
}
