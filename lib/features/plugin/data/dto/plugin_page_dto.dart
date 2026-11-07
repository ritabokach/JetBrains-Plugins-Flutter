import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_summary_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plugin_page_dto.g.dart';

/// Ответ `GET /searchPlugins?search=…&offset=0&max=20`: страница списка.
@JsonSerializable()
class PluginPageDto {
  const PluginPageDto({required this.plugins, required this.total});

  factory PluginPageDto.fromJson(Map<String, dynamic> json) =>
      _$PluginPageDtoFromJson(json);

  final List<PluginSummaryDto> plugins;

  /// Сколько записей нашлось всего. Сервер не отдаёт больше 10000.
  final int total;
}
