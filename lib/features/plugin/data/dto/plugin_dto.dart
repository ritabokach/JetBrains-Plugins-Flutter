import 'package:jetbrains_plugins/features/plugin/data/dto/vendor_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plugin_dto.g.dart';

/// Ответ `GET /plugins/{id}`: плагин целиком.
///
/// В ответе много полей, DTO описывает только те, что нужны приложению.
/// Оценки здесь нет, она приходит отдельным запросом.
@JsonSerializable()
class PluginDto {
  const PluginDto({
    required this.id,
    required this.xmlId,
    required this.name,
    required this.preview,
    required this.downloads,
    required this.pricingModel,
    required this.tags,
    required this.vendor,
    required this.urls,
  });

  factory PluginDto.fromJson(Map<String, dynamic> json) =>
      _$PluginDtoFromJson(json);

  final int id;
  final String xmlId;
  final String name;
  @JsonKey(defaultValue: '')
  final String preview;
  final int downloads;
  final String pricingModel;

  /// Здесь теги объектами, а не строками, как в списке.
  @JsonKey(defaultValue: <TagDto>[])
  final List<TagDto> tags;
  final VendorDto? vendor;
  final PluginUrlsDto? urls;
}

@JsonSerializable()
class TagDto {
  const TagDto({required this.name});

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  final String name;
}

/// Ссылки плагина. Незаполненная ссылка приходит пустой строкой или не
/// приходит совсем.
@JsonSerializable()
class PluginUrlsDto {
  const PluginUrlsDto({
    required this.docUrl,
    required this.sourceCodeUrl,
    required this.bugtrackerUrl,
    required this.forumUrl,
  });

  factory PluginUrlsDto.fromJson(Map<String, dynamic> json) =>
      _$PluginUrlsDtoFromJson(json);

  final String? docUrl;
  final String? sourceCodeUrl;
  final String? bugtrackerUrl;
  final String? forumUrl;
}
