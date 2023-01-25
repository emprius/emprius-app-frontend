import 'dart:async';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/core/services/storage/hive_storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service_provider.dart';
import 'package:empriusapp/src/core/theme/app_theme.dart';
import 'package:empriusapp/src/core/theme/size_config.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    /// Hive-specific initialization
    await Hive.initFlutter();
    final StorageService initializedStorageService = HiveStorageService();
    await initializedStorageService.init();
    runApp(
        ProviderScope(
            overrides: [
              storageServiceProvider.overrideWithValue(initializedStorageService),
            ],
            child: MyApp()
        ));
  }, (e, _) => throw e);
}

class MyApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SizeConfig().init(context);

    return MaterialApp(
      title: 'Emprius app',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: splashScreenRoute,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
        scheme: FlexScheme.verdunHemlock,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: buildTextTheme(),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.verdunHemlock,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: buildTextTheme(),
      ),
    );
  }

  TextTheme buildTextTheme() {
    return const TextTheme(
        headline1: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 34,
            ),
        headline2: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 24,
        ),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 20,
        ),
        bodyText1: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
        ),
        bodyText2: TextStyle(
            fontFamily: "Roboto",
            fontSize: 14,
        ),
        subtitle1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
        ),
        button: TextStyle(
          fontFamily: "Roboto",
          fontSize: 10,
        ),
      );
  }
}



