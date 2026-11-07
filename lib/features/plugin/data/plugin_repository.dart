import 'dart:async';

import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/data/data_sources/i_plugin_data_source.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/rating_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/mappers/plugin_mapper.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

/// Репозиторий на сети. Берёт DTO у датасорса и отдаёт наверх только модели
/// приложения. Ошибки датасорса уже переведены в LoadException и идут наверх
/// как есть, кроме 404 у детали и вендора: это не ошибка, а «записи нет».
final class PluginRepository implements IPluginRepository {
  const PluginRepository(this._dataSource);

  final IPluginDataSource _dataSource;

  @override
  Future<List<PluginModel>> getPlugins({
    required int offset,
    required int limit,
  }) => _search(null, orderBy: _byDownloads, offset: offset, limit: limit);

  @override
  Future<List<PluginModel>> searchPlugins(
    String query, {
    required int offset,
    required int limit,
  }) => _search(query, offset: offset, limit: limit);

  @override
  Future<PluginModel?> getPlugin(int id) async {
    final PluginDto plugin;
    final RatingDto rating;
    try {
      // Оценки в ответе плагина нет, её отдаёт отдельный адрес. Запросы не
      // зависят друг от друга, поэтому идут параллельно.
      (plugin, rating) = await (
        _dataSource.getPlugin(id),
        _dataSource.getRating(id),
      ).wait;
    } on ParallelWaitError<
      (PluginDto?, RatingDto?),
      (AsyncError?, AsyncError?)
    > catch (error) {
      // .wait у пары бросает не исходную ошибку, а ParallelWaitError с
      // ошибками обоих запросов. Ошибка самого плагина важнее.
      final first = (error.errors.$1 ?? error.errors.$2)!;
      if (first.error is NotFoundException) return null;
      Error.throwWithStackTrace(first.error, first.stackTrace);
    }
    return plugin.toModel(rating: rating.average);
  }

  @override
  Future<VendorModel?> getVendor(String slug) async {
    try {
      final vendor = await _dataSource.getVendor(slug);
      return vendor.toModel();
    } on NotFoundException {
      return null;
    }
  }

  @override
  Future<List<PluginModel>> getPluginsByVendor(String slug) async {
    final plugins = await _dataSource.getVendorPlugins(slug);
    return [for (final plugin in plugins) plugin.toModel()];
  }

  /// Каталог открывается самыми популярными плагинами. Результаты поиска
  /// остаются в порядке релевантности: по `kot` первым должен быть Kotlin.
  static const String _byDownloads = 'downloads';

  Future<List<PluginModel>> _search(
    String? query, {
    String? orderBy,
    required int offset,
    required int limit,
  }) async {
    final page = await _dataSource.searchPlugins(
      search: query,
      orderBy: orderBy,
      offset: offset,
      max: limit,
    );
    return [for (final plugin in page.plugins) plugin.toModel()];
  }
}
