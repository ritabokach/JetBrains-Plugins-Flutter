import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';

sealed class PluginDetailState {
  const PluginDetailState();
}

final class PluginDetailLoading extends PluginDetailState {
  const PluginDetailLoading();
}

final class PluginDetailLoaded extends PluginDetailState {
  const PluginDetailLoaded(this.plugin);

  final PluginModel plugin;
}

final class PluginDetailNotFound extends PluginDetailState {
  const PluginDetailNotFound(this.id);

  final int id;
}
