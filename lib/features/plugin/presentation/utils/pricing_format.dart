import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/common/theme/app_colors.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_pricing.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

extension PricingFormat on PluginPricing {
  String label(AppLocalizations l10n) => switch (this) {
    PluginPricing.free => l10n.pricingFree,
    PluginPricing.freemium => l10n.pricingFreemium,
    PluginPricing.paid => l10n.pricingPaid,
  };

  Color get color => switch (this) {
    PluginPricing.free => AppColors.pricingFree,
    PluginPricing.freemium => AppColors.pricingFreemium,
    PluginPricing.paid => AppColors.pricingPaid,
  };
}
