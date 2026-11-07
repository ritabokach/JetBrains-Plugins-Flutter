import 'package:json_annotation/json_annotation.dart';

part 'plugin_summary_dto.g.dart';

/// Плагин в списке: элемент ответа `/searchPlugins` и
/// `/vendors/{name}/plugins`.
///
/// Вендор здесь урезанный: только имя для показа и отметка о проверке. Ни
/// его адреса на сервере, ни сайта, ни страны в списке нет.
@JsonSerializable()
class PluginSummaryDto {
  const PluginSummaryDto({
    required this.id,
    required this.xmlId,
    required this.name,
    required this.preview,
    required this.downloads,
    required this.pricingModel,
    required this.rating,
    required this.tags,
    required this.vendor,
  });

  factory PluginSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$PluginSummaryDtoFromJson(json);

  final int id;
  final String xmlId;
  final String name;
  @JsonKey(defaultValue: '')
  final String preview;
  final int downloads;

  /// FREE, FREEMIUM или PAID.
  final String pricingModel;

  /// У плагина без оценок поля нет совсем.
  final double? rating;

  /// У части плагинов поля нет совсем.
  @JsonKey(defaultValue: <String>[])
  final List<String> tags;

  /// У части плагинов поля нет совсем.
  final PluginSummaryVendorDto? vendor;
}

@JsonSerializable()
class PluginSummaryVendorDto {
  const PluginSummaryVendorDto({required this.name, required this.isVerified});

  factory PluginSummaryVendorDto.fromJson(Map<String, dynamic> json) =>
      _$PluginSummaryVendorDtoFromJson(json);

  /// Имя для показа, в полном ответе вендора это publicName.
  final String name;
  @JsonKey(defaultValue: false)
  final bool isVerified;
}
