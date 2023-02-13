import 'dart:async';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/core/services/storage/hive_storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Hive-specific initialization
    await Hive.initFlutter();
    final StorageService initializedStorageService = HiveStorageService();
    await initializedStorageService.init();
    //final sharedPreferences = await SharedPreferences.getInstance();
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
        headline6: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
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
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        button: TextStyle(
          fontFamily: "Roboto",
          fontSize: 10,
        ),
      );
  }
}



