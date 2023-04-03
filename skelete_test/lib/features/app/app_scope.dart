import 'package:skelete_test/config/configuration_variables.dart';
import 'package:skelete_test/config/env.dart';
import 'package:skelete_test/core/src/app_logger.dart';
import 'package:skelete_test/di/di.dart';
import 'package:skelete_test/features/app/application/cubits/locale_cubit.dart';
import 'package:skelete_test/features/app/application/cubits/theme_mode_cubit.dart';
import 'package:skelete_test/features/app/data/providers/locale/hive_locale_local_provider.dart';
import 'package:skelete_test/features/app/data/providers/locale/locale_local_provider.dart';
import 'package:skelete_test/features/app/data/providers/theme/hive_theme_mode_local_provider.dart';
import 'package:skelete_test/features/app/data/providers/theme/theme_mode_local_provider.dart';
import 'package:skelete_test/features/app/data/repositories/locale_repository_impl.dart';
import 'package:skelete_test/features/app/data/repositories/theme_mode_repository_impl.dart';
import 'package:skelete_test/features/app/domain/repositories_interfaces/locale_repository.dart';
import 'package:skelete_test/features/app/domain/repositories_interfaces/theme_mode_repository.dart';
import 'package:skelete_test/features/app/presentation/theme/theme_facade.dart';
import 'package:skelete_test/hive/hive.dart';
import 'package:skelete_test/localization/localization.dart';
import 'package:skelete_test/navigation/app_router.dart';

class AppScope extends GetItScope {
  AppScope._();

  static final AppScope instance = AppScope._();

  ThemeFacade getThemeFacade() {
    return getIt.get<ThemeFacade>();
  }

  ThemeModeCubit getThemeModeCubit() {
    return getIt.get<ThemeModeCubit>();
  }

  LocaleCubit getLocaleCubit() {
    return getIt.get<LocaleCubit>();
  }

  ConfigurationVariables getConfigurationVariables() {
    return getIt.get<ConfigurationVariables>();
  }

  AppLocalizationsFacade getAppLocalizationsFacade() {
    return getIt.get<AppLocalizationsFacade>();
  }

  AppRouter getAppRouter() {
    return getIt.get<AppRouter>();
  }

  AppLogger getLogger() {
    return getIt.get<AppLogger>();
  }

  @override
  Future<void> configure() async {
    getIt

      /// Core
      ..registerSingleton<ConfigurationVariables>(
        DebugConfigurationVariables(),
      )
      ..registerSingleton<AppRouter>(
        BeamerAppRouter(),
      )
      ..registerSingleton<AppLogger>(
        AppLogger(),
      )
      ..registerSingleton<AppLocalizationsFacade>(
        AppLocalizationsFacade(),
      )
      ..registerSingleton<ThemeFacade>(
        ThemeFacade(),
      )

      /// Data

      ..registerSingletonAsync<HiveFacade>(
        () async {
          final instance = HiveFacadeImpl();

          await instance.initialize();

          return instance;
        },
      )
      ..registerSingletonAsync<ThemeModeLocalProvider>(
        () async {
          final box = await getIt<HiveFacade>().openBox<String>(
            HiveBoxesKeys.themeMode,
          );

          return HiveThemeModeLocalProvider(hiveBoxFacade: box);
        },
        dependsOn: [HiveFacade],
      )
      ..registerSingletonAsync<LocaleLocalProvider>(
        () async {
          final box = await getIt<HiveFacade>().openBox<String>(
            HiveBoxesKeys.locale,
          );

          return HiveLocaleLocalProvider(hiveBoxFacade: box);
        },
        dependsOn: [HiveFacade],
      )

      /// Application

      /// *** Repositories

      ..registerSingletonWithDependencies<ThemeModeRepository>(
        () => ThemeModeRepositoryImpl(
          localProvider: getIt<ThemeModeLocalProvider>(),
        ),
        dependsOn: [ThemeModeLocalProvider],
      )
      ..registerSingletonWithDependencies<LocaleRepository>(
        () => LocaleRepositoryImpl(
          localProvider: getIt<LocaleLocalProvider>(),
        ),
        dependsOn: [LocaleLocalProvider],
      )

      /// *** Cubits

      ..registerSingletonAsync<ThemeModeCubit>(
        () async {
          final instance = ThemeModeCubit(
            repository: getIt<ThemeModeRepository>(),
          );

          await instance.setSavedThemeMode();

          return instance;
        },
        dependsOn: [ThemeModeRepository],
      )
      ..registerSingletonAsync<LocaleCubit>(
        () async {
          final instance = LocaleCubit(
            supportedLocales: getIt<AppLocalizationsFacade>().supportedLocales,
            repository: getIt<LocaleRepository>(),
          );

          await instance.setSavedLocale();

          return instance;
        },
        dependsOn: [LocaleRepository],
      );

    await getIt.allReady();
  }
}
