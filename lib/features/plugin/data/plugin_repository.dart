import 'package:jetbrains_plugins/features/plugin/data/mock_plugins.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

final class PluginRepository implements IPluginRepository {
  const PluginRepository();

  @override
  Future<List<PluginModel>> getPlugins() async => mockPlugins;

  @override
  Future<List<PluginModel>> searchPlugins(String query) async {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return mockPlugins;
    return [
      for (final plugin in mockPlugins)
        if (plugin.name.toLowerCase().contains(needle)) plugin,
    ];
  }

  @override
  Future<PluginModel?> getPlugin(int id) async {
    for (final plugin in mockPlugins) {
      if (plugin.id == id) return plugin;
    }
    return null;
  }

  @override
  Future<VendorModel?> getVendor(int id) async {
    for (final vendor in mockVendors) {
      if (vendor.id == id) return vendor;
    }
    return null;
  }

  @override
  Future<List<PluginModel>> getPluginsByVendor(int vendorId) async => [
    for (final plugin in mockPlugins)
      if (plugin.vendor.id == vendorId) plugin,
  ];
}
