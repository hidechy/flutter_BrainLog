// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawer_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawerListState {
  List<DateTime> get drawerDateList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawerListStateCopyWith<DrawerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawerListStateCopyWith<$Res> {
  factory $DrawerListStateCopyWith(
          DrawerListState value, $Res Function(DrawerListState) then) =
      _$DrawerListStateCopyWithImpl<$Res, DrawerListState>;
  @useResult
  $Res call({List<DateTime> drawerDateList});
}

/// @nodoc
class _$DrawerListStateCopyWithImpl<$Res, $Val extends DrawerListState>
    implements $DrawerListStateCopyWith<$Res> {
  _$DrawerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawerDateList = null,
  }) {
    return _then(_value.copyWith(
      drawerDateList: null == drawerDateList
          ? _value.drawerDateList
          : drawerDateList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrawerListStateImplCopyWith<$Res>
    implements $DrawerListStateCopyWith<$Res> {
  factory _$$DrawerListStateImplCopyWith(_$DrawerListStateImpl value,
          $Res Function(_$DrawerListStateImpl) then) =
      __$$DrawerListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DateTime> drawerDateList});
}

/// @nodoc
class __$$DrawerListStateImplCopyWithImpl<$Res>
    extends _$DrawerListStateCopyWithImpl<$Res, _$DrawerListStateImpl>
    implements _$$DrawerListStateImplCopyWith<$Res> {
  __$$DrawerListStateImplCopyWithImpl(
      _$DrawerListStateImpl _value, $Res Function(_$DrawerListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drawerDateList = null,
  }) {
    return _then(_$DrawerListStateImpl(
      drawerDateList: null == drawerDateList
          ? _value._drawerDateList
          : drawerDateList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc

class _$DrawerListStateImpl implements _DrawerListState {
  const _$DrawerListStateImpl({final List<DateTime> drawerDateList = const []})
      : _drawerDateList = drawerDateList;

  final List<DateTime> _drawerDateList;
  @override
  @JsonKey()
  List<DateTime> get drawerDateList {
    if (_drawerDateList is EqualUnmodifiableListView) return _drawerDateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drawerDateList);
  }

  @override
  String toString() {
    return 'DrawerListState(drawerDateList: $drawerDateList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawerListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._drawerDateList, _drawerDateList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_drawerDateList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawerListStateImplCopyWith<_$DrawerListStateImpl> get copyWith =>
      __$$DrawerListStateImplCopyWithImpl<_$DrawerListStateImpl>(
          this, _$identity);
}

abstract class _DrawerListState implements DrawerListState {
  const factory _DrawerListState({final List<DateTime> drawerDateList}) =
      _$DrawerListStateImpl;

  @override
  List<DateTime> get drawerDateList;
  @override
  @JsonKey(ignore: true)
  _$$DrawerListStateImplCopyWith<_$DrawerListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
