import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/common/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(
    brightness: Brightness.light,
    brand: AppColors.brandLight,
    onBrand: AppColors.onBrandLight,
    background: AppColors.backgroundLight,
    surface: AppColors.surfaceLight,
    surfaceVariant: AppColors.surfaceVariantLight,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    brand: AppColors.brandDark,
    onBrand: AppColors.onBrandDark,
    background: AppColors.backgroundDark,
    surface: AppColors.surfaceDark,
    surfaceVariant: AppColors.surfaceVariantDark,
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color brand,
    required Color onBrand,
    required Color background,
    required Color surface,
    required Color surfaceVariant,
  }) {
    final colorScheme =
        ColorScheme.fromSeed(seedColor: brand, brightness: brightness).copyWith(
          primary: brand,
          onPrimary: onBrand,
          surface: surface,
          surfaceContainer: surface,
          surfaceContainerHighest: surfaceVariant,
        );
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
    );
  }
}
