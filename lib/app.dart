import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/navigation/app_router.dart';
import 'package:jetbrains_plugins/common/network/dio_client.dart';
import 'package:jetbrains_plugins/common/theme/app_theme.dart';
import 'package:jetbrains_plugins/common/theme/theme_cubit.dart';
import 'package:jetbrains_plugins/features/plugin/data/api/plugin_api.dart';
import 'package:jetbrains_plugins/features/plugin/data/data_sources/network_plugin_data_source.dart';
import 'package:jetbrains_plugins/features/plugin/data/plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_cubit.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IPluginRepository>(
      // Цепочка собирается только здесь: Dio → API-клиент → датасорс →
      // репозиторий. Dio один на всё приложение.
      create: (_) => PluginRepository(
        NetworkPluginDataSource(PluginApi(DioClient.create())),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PluginListCubit(context.read<IPluginRepository>())..load(),
          ),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp.router(
            routerConfig: AppRouter.router,
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    );
  }
}
