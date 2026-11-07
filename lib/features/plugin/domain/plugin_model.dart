import 'package:jetbrains_plugins/features/plugin/domain/plugin_pricing.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_urls.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

final class PluginModel {
  const PluginModel({
    required this.id,
    required this.xmlId,
    required this.name,
    required this.preview,
    required this.downloads,
    required this.rating,
    required this.pricing,
    required this.tags,
    required this.vendor,
    this.urls = const PluginUrls(),
  });

  final int id;
  final String xmlId;
  final String name;
  final String preview;
  final int downloads;
  final double? rating;
  final PluginPricing pricing;
  final List<String> tags;
  final VendorModel vendor;
  final PluginUrls urls;
}
