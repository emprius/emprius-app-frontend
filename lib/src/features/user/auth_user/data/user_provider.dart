import 'package:empriusapp/src/core/services/storage/storage_service_provider.dart';
import 'package:empriusapp/src/features/user/application/user_controller.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_http_repository.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_storage_repository.dart';
import 'package:empriusapp/src/features/user/auth_user/domain/auth_state.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final _userHttpProvider = Provider<UserHttpRepository>((ref) {
  // todo(kon): implement http service provider
  // final _apiService = ref.watch(_apiServiceProvider);
  // return UserHttpRepository(apiService: _apiService);
  return UserHttpRepository();
});


final userProvider = StateNotifierProvider<UserController, UserModel>((ref) {
  final _userStorageRepository = UserStorageRepository(
      storageServiceProvider: ref.watch(storageServiceProvider)
  );
  final _userHttpRepository =  ref.watch(_userHttpProvider);
  return UserController(
      userStorageRepository: _userStorageRepository,
      userHttpRepository: _userHttpRepository
  );
});
