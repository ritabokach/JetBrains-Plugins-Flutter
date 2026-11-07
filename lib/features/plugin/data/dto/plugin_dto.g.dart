// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PluginDto _$PluginDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PluginDto', json, ($checkedConvert) {
      final val = PluginDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        xmlId: $checkedConvert('xmlId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        preview: $checkedConvert('preview', (v) => v as String? ?? ''),
        downloads: $checkedConvert('downloads', (v) => (v as num).toInt()),
        pricingModel: $checkedConvert('pricingModel', (v) => v as String),
        tags: $checkedConvert(
          'tags',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => TagDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        ),
        vendor: $checkedConvert(
          'vendor',
          (v) =>
              v == null ? null : VendorDto.fromJson(v as Map<String, dynamic>),
        ),
        urls: $checkedConvert(
          'urls',
          (v) => v == null
              ? null
              : PluginUrlsDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

TagDto _$TagDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TagDto', json, ($checkedConvert) {
      final val = TagDto(name: $checkedConvert('name', (v) => v as String));
      return val;
    });

PluginUrlsDto _$PluginUrlsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PluginUrlsDto', json, ($checkedConvert) {
      final val = PluginUrlsDto(
        docUrl: $checkedConvert('docUrl', (v) => v as String?),
        sourceCodeUrl: $checkedConvert('sourceCodeUrl', (v) => v as String?),
        bugtrackerUrl: $checkedConvert('bugtrackerUrl', (v) => v as String?),
        forumUrl: $checkedConvert('forumUrl', (v) => v as String?),
      );
      return val;
    });
