import 'dart:async';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/core/services/storage/hive_storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service.dart';
import 'package:empriusapp/src/core/services/storage/storage_service_provider.dart';
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
    return const MaterialApp(
        title: 'Emprius app',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: splashScreenRoute,
    );
  }
}