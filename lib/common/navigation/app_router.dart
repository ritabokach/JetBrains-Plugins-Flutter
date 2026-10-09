import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jetbrains_plugins/common/widgets/app_scaffold.dart';
import 'package:jetbrains_plugins/common/widgets/message_view.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/plugin_detail_screen.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/plugin_list_screen.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/vendor_screen.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

abstract final class AppRoutes {
  static const String list = '/';

  static String plugin(int id) => '/plugin/$id';

  static String vendor(int id) => '/vendor/$id';
}

abstract final class AppRouter {
  static const Duration _transition = Duration(milliseconds: 300);

  static final GoRouter router = _create();

  static GoRouter _create() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    return GoRouter(
      initialLocation: AppRoutes.list,
      routes: [
        GoRoute(
          path: AppRoutes.list,
          pageBuilder: (context, state) =>
              _page(state, const PluginListScreen()),
          routes: [
            GoRoute(
              path: 'plugin/:id',
              pageBuilder: (context, state) => _page(
                state,
                _withId(state, (id) => PluginDetailScreen(id: id)),
              ),
            ),
            GoRoute(
              path: 'vendor/:id',
              pageBuilder: (context, state) =>
                  _page(state, _withId(state, (id) => VendorScreen(id: id))),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const _NotFoundScreen(),
    );
  }

  static Widget _withId(GoRouterState state, Widget Function(int id) build) {
    final id = int.tryParse(state.pathParameters['id'] ?? '');
    return id == null ? const _NotFoundScreen() : build(id);
  }

  static Page<void> _page(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: _transition,
      reverseTransitionDuration: _transition,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final incoming = animation.drive(
          CurveTween(curve: Curves.easeOutCubic),
        );
        final outgoing = secondaryAnimation.drive(
          CurveTween(curve: Curves.easeOutCubic),
        );
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(incoming),
          child: SlideTransition(
            position: Tween(
              begin: Offset.zero,
              end: const Offset(-0.25, 0),
            ).animate(outgoing),
            child: FadeTransition(opacity: incoming, child: child),
          ),
        );
      },
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: MessageView(text: AppLocalizations.of(context).pageNotFound),
    );
  }
}
