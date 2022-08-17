import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hive_storage_service.dart';
import 'storage_service.dart';

final storageServiceProvider = Provider<StorageService>(
  (_) => HiveStorageService(),
);
