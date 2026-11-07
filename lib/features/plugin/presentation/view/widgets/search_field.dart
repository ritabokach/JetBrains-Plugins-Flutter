import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.initialQuery,
    required this.onChanged,
  });

  final String initialQuery;
  final ValueChanged<String> onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) => TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: l10n.searchHint,
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
                  tooltip: l10n.searchClear,
                  icon: const Icon(Icons.close),
                  onPressed: _clear,
                ),
        ),
      ),
    );
  }
}
