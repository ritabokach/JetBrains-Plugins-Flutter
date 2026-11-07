import 'package:flutter/widgets.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

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

extension PluginLinks on PluginModel {
  List<(String label, String url)> links(AppLocalizations l10n) => [
    for (final (label, url) in [
      (l10n.linkDoc, urls.docUrl),
      (l10n.linkSource, urls.sourceCodeUrl),
      (l10n.linkBugtracker, urls.bugtrackerUrl),
      (l10n.linkForum, urls.forumUrl),
    ])
      if (url.trim().isNotEmpty) (label, url),
  ];
}
