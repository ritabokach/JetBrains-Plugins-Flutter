import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

/// Все методы при ошибке загрузки бросают LoadException из `common/network`.
abstract interface class IPluginRepository {
  Future<List<PluginModel>> getPlugins({
    required int offset,
    required int limit,
  });

  Future<List<PluginModel>> searchPlugins(
    String query, {
    required int offset,
    required int limit,
  });

  /// null, если плагина с таким номером нет.
  Future<PluginModel?> getPlugin(int id);

  /// null, если вендора с таким ключом нет.
  Future<VendorModel?> getVendor(String slug);

  Future<List<PluginModel>> getPluginsByVendor(String slug);
}
