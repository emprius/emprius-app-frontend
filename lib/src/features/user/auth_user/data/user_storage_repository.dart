import 'dart:convert';
import 'package:empriusapp/src/core/services/storage/storage_service.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';

/// Repository class to wrap interactions related to the user and the storage
/// provider
class UserStorageRepository {

  static const _storageUserKey = 'emprius_user';

  final StorageService _storageServiceProvider;

  UserStorageRepository({required StorageService storageServiceProvider,})
      : _storageServiceProvider = storageServiceProvider;

  Future setUser(UserModel user) async {
    await _storageServiceProvider.set(_storageUserKey, json.encode(user.toJson()));
  }

  Future<UserModel?> getUser() async {
    final rawUser = await _storageServiceProvider.get(_storageUserKey);
    return rawUser == null ? null : UserModel.fromJson(
      json.decode(rawUser),
    );
  }
}