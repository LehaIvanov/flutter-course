import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_filter.freezed.dart';

@freezed
class UsersFilter with _$UsersFilter {
  const factory UsersFilter({
    required String name,
    required int minAge,
  }) = _UsersFilter;
}
