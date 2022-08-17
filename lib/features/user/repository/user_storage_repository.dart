

import 'dart:convert';

import 'package:empriusapp/core/services/storage/storage_service.dart';
import 'package:empriusapp/features/user/models/user_model.dart';

/// Repository class to wrap interactions related to the user and the storage
/// provider
class UserStorageRepository {

  static const _storageUserKey = 'own_user';

  StorageService _storageServiceProvider;

  UserStorageRepository({required StorageService storageServiceProvider,})
      : _storageServiceProvider = storageServiceProvider;

  Future setUser(UserModel user) async {
    await _storageServiceProvider.set(_storageUserKey, user.toJson());
  }

  UserModel? getUser() {
    final rawUser = _storageServiceProvider.get(_storageUserKey);
    return rawUser == null ? null : UserModel.fromJson(
      json.decode(json.encode(rawUser)),
    );
  }
}