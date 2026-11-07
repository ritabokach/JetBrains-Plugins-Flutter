import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/plugin_summary_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/rating_dto.dart';
import 'package:jetbrains_plugins/features/plugin/data/dto/vendor_dto.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_pricing.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_urls.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

/// Перевод ответа сервера в модель приложения. Имена полей API известны
/// только DTO и этому файлу.
extension PluginSummaryDtoMapper on PluginSummaryDto {
  PluginModel toModel() => PluginModel(
    id: id,
    xmlId: xmlId,
    name: name,
    preview: _unescape(preview),
    downloads: downloads,
    rating: rating,
    pricing: _pricing(pricingModel),
    tags: tags,
    vendor: VendorModel(
      name: vendor?.name ?? '',
      url: '',
      country: null,
      isVerified: vendor?.isVerified ?? false,
    ),
  );
}

extension PluginDtoMapper on PluginDto {
  /// [rating] приходит отдельным запросом, в самом ответе плагина его нет.
  PluginModel toModel({required double? rating}) => PluginModel(
    id: id,
    xmlId: xmlId,
    name: name,
    preview: _unescape(preview),
    downloads: downloads,
    rating: rating,
    pricing: _pricing(pricingModel),
    tags: [for (final tag in tags) tag.name],
    vendor:
        vendor?.toModel() ??
        const VendorModel(name: '', url: '', country: null, isVerified: false),
    urls: PluginUrls(
      docUrl: urls?.docUrl ?? '',
      sourceCodeUrl: urls?.sourceCodeUrl ?? '',
      bugtrackerUrl: urls?.bugtrackerUrl ?? '',
      forumUrl: urls?.forumUrl ?? '',
    ),
  );
}

extension VendorDtoMapper on VendorDto {
  VendorModel toModel() => VendorModel(
    slug: name,
    name: publicName ?? name,
    url: url ?? '',
    country: country,
    isVerified: isVerified,
  );
}

extension RatingDtoMapper on RatingDto {
  /// Средняя по голосам. В списке сервер присылает готовую оценку, у детали
  /// её считаем сами, поэтому во втором знаке они могут разойтись.
  double? get average {
    var count = 0;
    var sum = 0;
    for (final MapEntry(:key, :value) in votes.entries) {
      final stars = int.tryParse(key);
      if (stars == null) continue;
      count += value;
      sum += stars * value;
    }
    return count == 0 ? null : sum / count;
  }
}

/// Модель распространения, которой нет в перечислении, считаем бесплатной:
/// так сервер показывает плагины без цены.
PluginPricing _pricing(String value) => switch (value) {
  'PAID' => PluginPricing.paid,
  'FREEMIUM' => PluginPricing.freemium,
  _ => PluginPricing.free,
};

/// В кратком описании сервер оставляет HTML-сущности: `Appearance &amp;
/// Behavior`.
String _unescape(String text) => text
    .replaceAll('&lt;', '<')
    .replaceAll('&gt;', '>')
    .replaceAll('&quot;', '"')
    .replaceAll('&#39;', "'")
    .replaceAll('&amp;', '&');
