import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

abstract interface class IPluginRepository {
  Future<List<PluginModel>> getPlugins();

  Future<List<PluginModel>> searchPlugins(String query);

  Future<PluginModel?> getPlugin(int id);

  Future<VendorModel?> getVendor(int id);

  Future<List<PluginModel>> getPluginsByVendor(int vendorId);
}
