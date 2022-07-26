import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_example/location.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  @JsonSerializable(explicitToJson: true) // для вложенных freezed объектов
  const factory Company(
      {required String name,
      String? director,
      required List<Location> locations}) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
