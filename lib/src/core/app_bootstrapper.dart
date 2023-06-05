import 'dart:async';

import 'package:clock/clock.dart';
import 'package:empriusapp/src/core/services/local/hive/hive_storage_service.dart';
import 'package:empriusapp/src/core/services/local/hive/storage_service.dart';
import 'package:empriusapp/src/core/services/local/hive/storage_service_provider.dart';
import 'package:empriusapp/src/core/services/local/key_value_storage_base.dart';
import 'package:empriusapp/src/core/services/local/path_provider_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// A wrapper class that contains methods to bootstrap the app launch.
///
/// It initializes the important services at app startup to allow
/// syncronous access to them later on.
class AppBootstrapper {
  const AppBootstrapper._();

  /// Initializer for important and asyncronous app services
  /// Should be called in main after `WidgetsBinding.FlutterInitialized()`.
  ///
  /// [mainAppWidget] is the first widget that loads on app startup.
  /// [runApp] is the main app binding method that launches our [mainAppWidget].
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // For preparing the key-value mem cache
    await KeyValueStorageBase.init();

    // For preparing to read application directory paths
    await PathProviderService.init();

    // Hive-specific initialization
    await Hive.initFlutter();
    final StorageService initializedStorageService = HiveStorageService();
    await initializedStorageService.init();

    // For prettyifying console debug messages
    debugPrint = _prettifyDebugPrint;

    runApp(
        ProviderScope(
            overrides: [
              storageServiceProvider.overrideWithValue(initializedStorageService),
            ],
            child: mainAppWidget
        ));

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
    final date = clock.now();
    var msg = '${date.year}/${date.month}/${date.day}';
    msg += ' ${date.hour}:${date.minute}:${date.second}';
    msg += ' $message';
    debugPrintSynchronously(msg, wrapWidth: wrapWidth);
  }
}
