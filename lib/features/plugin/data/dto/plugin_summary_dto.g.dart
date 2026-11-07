// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PluginSummaryDto _$PluginSummaryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PluginSummaryDto', json, ($checkedConvert) {
      final val = PluginSummaryDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        xmlId: $checkedConvert('xmlId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        preview: $checkedConvert('preview', (v) => v as String? ?? ''),
        downloads: $checkedConvert('downloads', (v) => (v as num).toInt()),
        pricingModel: $checkedConvert('pricingModel', (v) => v as String),
        rating: $checkedConvert('rating', (v) => (v as num?)?.toDouble()),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
        ),
        vendor: $checkedConvert(
          'vendor',
          (v) => v == null
              ? null
              : PluginSummaryVendorDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

PluginSummaryVendorDto _$PluginSummaryVendorDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PluginSummaryVendorDto', json, ($checkedConvert) {
  final val = PluginSummaryVendorDto(
    name: $checkedConvert('name', (v) => v as String),
    isVerified: $checkedConvert('isVerified', (v) => v as bool? ?? false),
  );
  return val;
});
