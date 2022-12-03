// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersFilter {
  String get name => throw _privateConstructorUsedError;
  int get minAge => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersFilterCopyWith<UsersFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersFilterCopyWith<$Res> {
  factory $UsersFilterCopyWith(
          UsersFilter value, $Res Function(UsersFilter) then) =
      _$UsersFilterCopyWithImpl<$Res, UsersFilter>;
  @useResult
  $Res call({String name, int minAge});
}

/// @nodoc
class _$UsersFilterCopyWithImpl<$Res, $Val extends UsersFilter>
    implements $UsersFilterCopyWith<$Res> {
  _$UsersFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minAge = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersFilterCopyWith<$Res>
    implements $UsersFilterCopyWith<$Res> {
  factory _$$_UsersFilterCopyWith(
          _$_UsersFilter value, $Res Function(_$_UsersFilter) then) =
      __$$_UsersFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int minAge});
}

/// @nodoc
class __$$_UsersFilterCopyWithImpl<$Res>
    extends _$UsersFilterCopyWithImpl<$Res, _$_UsersFilter>
    implements _$$_UsersFilterCopyWith<$Res> {
  __$$_UsersFilterCopyWithImpl(
      _$_UsersFilter _value, $Res Function(_$_UsersFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minAge = null,
  }) {
    return _then(_$_UsersFilter(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UsersFilter implements _UsersFilter {
  const _$_UsersFilter({required this.name, required this.minAge});

  @override
  final String name;
  @override
  final int minAge;

  @override
  String toString() {
    return 'UsersFilter(name: $name, minAge: $minAge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersFilter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minAge, minAge) || other.minAge == minAge));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, minAge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersFilterCopyWith<_$_UsersFilter> get copyWith =>
      __$$_UsersFilterCopyWithImpl<_$_UsersFilter>(this, _$identity);
}

abstract class _UsersFilter implements UsersFilter {
  const factory _UsersFilter(
      {required final String name, required final int minAge}) = _$_UsersFilter;

  @override
  String get name;
  @override
  int get minAge;
  @override
  @JsonKey(ignore: true)
  _$$_UsersFilterCopyWith<_$_UsersFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
