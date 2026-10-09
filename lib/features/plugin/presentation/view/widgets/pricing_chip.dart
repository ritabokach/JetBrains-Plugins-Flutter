import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/common/theme/app_colors.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_pricing.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/utils/pricing_format.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/label_chip.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class PricingChip extends StatelessWidget {
  const PricingChip({super.key, required this.pricing});

  final PluginPricing pricing;

  @override
  Widget build(BuildContext context) {
    return LabelChip(
      text: pricing.label(AppLocalizations.of(context)),
      background: pricing.color,
      foreground: AppColors.onPricing,
    );
  }
}
