import 'dart:async';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/core/services/storage/hive_storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    final StorageService initializedStorageService = HiveStorageService();
    await initializedStorageService.init();
    runApp(
        ProviderScope(
            overrides: [
              storageServiceProvider.overrideWithValue(initializedStorageService),
            ],
            child: MyApp()
        )
    );

  }, (e, _) => throw e);
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        scheme: FlexScheme.verdunHemlock,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.verdunHemlock,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      //theme: FlexColorScheme.light(scheme: FlexScheme.verdunHemlock).toTheme,
        //darkTheme: FlexColorScheme.dark(scheme: FlexScheme.verdunHemlock).toTheme,
        title: 'Emprius app',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: splashScreenRoute,
    );
  }
}