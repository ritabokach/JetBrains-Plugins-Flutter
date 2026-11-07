import 'package:dio/dio.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_page_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_summary_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/rating_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/vendor_dto.dart';

/// API-клиент: один метод на один адрес сервера, ответ разбирается в DTO.
///
/// Клиент знает адреса и параметры запросов, но не знает, что делать с
/// ошибками и как устроены модели приложения. Это задачи датасорса и
/// репозитория.
final class PluginApi {
  const PluginApi(this._dio);

  final Dio _dio;

  /// Без [search] сервер отдаёт весь каталог в своём порядке по умолчанию.
  /// [max] больше 24 сервер не принимает.
  Future<PluginPageDto> searchPlugins({
    String? search,
    required int offset,
    required int max,
  }) async {
    final json = await _getMap(
      '/searchPlugins',
      queryParameters: {'search': ?search, 'offset': offset, 'max': max},
    );
    return PluginPageDto.fromJson(json);
  }

  Future<PluginDto> getPlugin(int id) async =>
      PluginDto.fromJson(await _getMap('/plugins/$id'));

  Future<RatingDto> getRating(int id) async =>
      RatingDto.fromJson(await _getMap('/plugins/$id/rating'));

  Future<VendorDto> getVendor(String name) async => VendorDto.fromJson(
    await _getMap('/vendors/${Uri.encodeComponent(name)}'),
  );

  /// Ответ — JSON-массив, а не объект, поэтому разбирается здесь по
  /// элементам.
  Future<List<PluginSummaryDto>> getVendorPlugins(String name) async {
    final response = await _dio.get<List<dynamic>>(
      '/vendors/${Uri.encodeComponent(name)}/plugins',
    );
    final json = response.data ?? (throw const FormatException('Пустой ответ'));
    return [
      for (final item in json)
        if (item is Map<String, dynamic>)
          PluginSummaryDto.fromJson(item)
        else
          throw const FormatException('Элемент списка не объект'),
    ];
  }

  /// dio сам разбирает JSON в Map. Пустой ответ здесь не ждём.
  Future<Map<String, dynamic>> _getMap(
    String path, {
    Map<String, Object>? queryParameters,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return response.data ?? (throw const FormatException('Пустой ответ'));
  }
}
