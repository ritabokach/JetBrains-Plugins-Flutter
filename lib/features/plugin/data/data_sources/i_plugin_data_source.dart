import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_page_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_summary_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/rating_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/vendor_dto.dart';

/// Откуда репозиторий берёт данные. Все методы при ошибке бросают
/// LoadException.
abstract interface class IPluginDataSource {
  Future<PluginPageDto> searchPlugins({
    String? search,
    String? orderBy,
    required int offset,
    required int max,
  });

  Future<PluginDto> getPlugin(int id);

  Future<RatingDto> getRating(int id);

  Future<VendorDto> getVendor(String name);

  Future<List<PluginSummaryDto>> getVendorPlugins(String name);
}
