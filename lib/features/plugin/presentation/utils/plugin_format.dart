import 'package:flutter/widgets.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';

extension PluginFormat on PluginModel {
  String get downloadsLabel => switch (downloads) {
    >= 1000000 => '${_round1(downloads / 1000000)}M',
    >= 1000 => '${_round1(downloads / 1000)}K',
    _ => '$downloads',
  };

  String? get ratingLabel {
    final value = rating;
    if (value == null) return null;
    return '${(value * 100).round() / 100}';
  }

  String get initial => name.isEmpty ? '' : name.characters.first.toUpperCase();
}

String _round1(double value) => '${(value * 10).round() / 10}';
