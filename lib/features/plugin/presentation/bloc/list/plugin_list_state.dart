import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';

sealed class PluginListState {
  const PluginListState({required this.query});

  final String query;
}

final class PluginListLoading extends PluginListState {
  const PluginListLoading({super.query = ''});
}

final class PluginListLoaded extends PluginListState {
  const PluginListLoaded({required super.query, required this.items});

  final List<PluginModel> items;

  bool get isNothingFound => items.isEmpty && query.trim().isNotEmpty;

  bool get isCatalogEmpty => items.isEmpty && query.trim().isEmpty;
}

final class PluginListFailure extends PluginListState {
  const PluginListFailure({required super.query});
}
