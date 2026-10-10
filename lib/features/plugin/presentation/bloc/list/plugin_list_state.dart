import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';

final class PluginListState {
  const PluginListState({this.query = '', this.items = const []});

  final String query;
  final List<PluginModel> items;

  bool get isNothingFound => items.isEmpty && query.trim().isNotEmpty;

  PluginListState copyWith({String? query, List<PluginModel>? items}) =>
      PluginListState(query: query ?? this.query, items: items ?? this.items);
}
