// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PluginPageDto _$PluginPageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PluginPageDto', json, ($checkedConvert) {
      final val = PluginPageDto(
        plugins: $checkedConvert(
          'plugins',
          (v) => (v as List<dynamic>)
              .map((e) => PluginSummaryDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
      );
      return val;
    });
