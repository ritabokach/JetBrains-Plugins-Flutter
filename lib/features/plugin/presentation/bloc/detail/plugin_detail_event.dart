sealed class PluginDetailEvent {
  const PluginDetailEvent();
}

final class PluginDetailOpened extends PluginDetailEvent {
  const PluginDetailOpened(this.id);

  final int id;
}
