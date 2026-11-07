import 'package:dio/dio.dart';
import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/data/api/plugin_api.dart';
import 'package:jetbrains_plugins/features/plugin/data/data_sources/i_plugin_data_source.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_page_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_summary_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/rating_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/vendor_dto.dart';
import 'package:json_annotation/json_annotation.dart';

/// Данные из сети через [PluginApi].
///
/// Ошибки dio и разбора ответа здесь превращаются в [LoadException]. Выше
/// про dio никто не знает.
final class NetworkPluginDataSource implements IPluginDataSource {
  const NetworkPluginDataSource(this._api);

  final PluginApi _api;

  @override
  Future<PluginPageDto> searchPlugins({
    String? search,
    String? orderBy,
    required int offset,
    required int max,
  }) => _guard(
    () => _api.searchPlugins(
      search: search,
      orderBy: orderBy,
      offset: offset,
      max: max,
    ),
  );

  @override
  Future<PluginDto> getPlugin(int id) => _guard(() => _api.getPlugin(id));

  @override
  Future<RatingDto> getRating(int id) => _guard(() => _api.getRating(id));

  @override
  Future<VendorDto> getVendor(String name) =>
      _guard(() => _api.getVendor(name));

  @override
  Future<List<PluginSummaryDto>> getVendorPlugins(String name) =>
      _guard(() => _api.getVendorPlugins(name));

  /// await внутри try обязателен: без него ошибка Future пройдёт мимо catch.
  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw _fromDio(error);
    } on CheckedFromJsonException {
      // Поля нет или оно не того типа: ответ не той формы, что описана в DTO.
      throw const BadResponseException();
    } on FormatException {
      throw const BadResponseException();
    }
  }

  LoadException _fromDio(DioException error) => switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => const TimeoutLoadException(),
    DioExceptionType.badResponse when error.response?.statusCode == 404 =>
      const NotFoundException(),
    DioExceptionType.badResponse => ServerException(error.response?.statusCode),
    // Испорченный JSON dio отдаёт как unknown с FormatException внутри.
    DioExceptionType.unknown when error.error is FormatException =>
      const BadResponseException(),
    DioExceptionType.connectionError ||
    DioExceptionType.badCertificate ||
    DioExceptionType.cancel ||
    DioExceptionType.unknown => const NoConnectionException(),
  };
}
