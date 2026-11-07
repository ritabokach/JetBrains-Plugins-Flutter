import 'package:json_annotation/json_annotation.dart';

part 'vendor_dto.g.dart';

/// Ответ `GET /vendors/{name}`. В этой же форме вендор вложен в ответ
/// `/plugins/{id}`.
@JsonSerializable()
class VendorDto {
  const VendorDto({
    required this.name,
    required this.publicName,
    required this.url,
    required this.country,
    required this.isVerified,
  });

  factory VendorDto.fromJson(Map<String, dynamic> json) =>
      _$VendorDtoFromJson(json);

  /// Ключ вендора в адресах сервера: `JetBrains`, `gerry` или UUID у
  /// частных лиц. Числового адреса у вендора нет.
  final String name;

  /// Имя для показа. Если его нет, показываем [name].
  final String? publicName;
  final String? url;
  final String? country;
  @JsonKey(defaultValue: false)
  final bool isVerified;
}
