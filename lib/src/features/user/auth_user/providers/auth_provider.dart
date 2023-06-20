import 'dart:io';

import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/local/key_value_storage_service.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/images/helpers/utils.dart';
import 'package:empriusapp/src/features/user/auth_user/data/auth_repository.dart';
import 'package:empriusapp/src/features/user/emprius_user/data/users_repository.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final currentUserProvider = StateProvider<UserModel?>((ref) => null);

final authProvider = StateNotifierProvider<AuthProvider, FutureState<bool?>>(
      (ref) {
    final _authRepository = ref.watch(authRepositoryProvider);
    final _keyValueStorageService = ref.watch(keyValueStorageServiceProvider);
    final _userRepository = ref.watch(usersRepositoryProvider);

    return AuthProvider(
      ref,
      authRepository: _authRepository,
      keyValueStorageService: _keyValueStorageService,
      userRepository: _userRepository,
    );
  },
);

class AuthProvider extends StateNotifier<FutureState<bool?>> {
  final AuthRepository _authRepository;
  final KeyValueStorageService _keyValueStorageService;
  final UsersRepository _userRepository;
  final Ref _ref;

  AuthProvider(
      this._ref, {
        required AuthRepository authRepository,
        required KeyValueStorageService keyValueStorageService,
        required UsersRepository userRepository,
      })  : _authRepository = authRepository,
        _keyValueStorageService = keyValueStorageService,
        _userRepository = userRepository,
        super(const FutureState.idle());

  Future<void> loadUserAuthDataInMemory() async {
    final student = _keyValueStorageService.getAuthUser();
    final password = await _keyValueStorageService.getAuthPassword();
    if (student != null && password.isNotEmpty) {
      _ref.read(currentUserProvider.notifier).state = student;
      state = const FutureState.data(data: true);
    }
  }

  void cacheAuthProfile(UserModel user) {
    _keyValueStorageService.setAuthUser(user);
  }

  void _cacheAuthPassword(String password) {
    _keyValueStorageService.setAuthPassword(password);
  }

  void _cacheAuthToken(String value) {
    _keyValueStorageService.setAuthToken(value);
  }

  Future<void> register({
    required String name,
    required String email,
    required LatLng location,
    required bool isActive,
    required String password,
    required String invite,
    File? avatar,
  }) async {
    state = const FutureState.loading();

    final userData = UserModel(
      name: name ,
      email: email ,
      location: location ,
      active: isActive ,
    );

    final data = userData.toJson();
    data['password'] = password;
    data['invitationToken'] = invite;
    data['community'] = "dummy";

    // if(avatar != null) {
    //   data['avatar'] = imageToBase64(avatar);
    // }

    state = await FutureState.makeGuardedRequest(() async {
      final registerSuccess = await _authRepository.sendRegisterData(
        data: data,
        updateTokenCallback: _cacheAuthToken,
      );

      // Do login to retrieve jwt and cache user data
      if( registerSuccess ) {
        final loginSuccess = await _doLogin(email: email, password: password);
        return loginSuccess && registerSuccess;
      }

      return false;
    });
  }

  /// Util function to do login and get the profile info
  ///
  /// It do login and also retrieve user information. Used after register and on
  /// login process.
  Future<bool> _doLogin({
    required String email,
    required String password,
  }) async {
    final data = {'email': email, 'password': password};

    final loginSuccess = await _authRepository.sendLoginData(
      data: data,
      updateTokenCallback: _cacheAuthToken,
    );

    if (loginSuccess) {
      final profile = await _userRepository.getAuthUserProfile();
      // Update current user in memory
      _ref
          .read(currentUserProvider.notifier)
          .state = profile;

      // Save authentication details in cache
      cacheAuthProfile(profile);
      _cacheAuthPassword(password);

      return true;
    }
    return false;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const FutureState.loading();

    state = await FutureState.makeGuardedRequest(() async {
      return _doLogin(email: email, password: password);
    });
  }

  void logout() {
    state = const FutureState.idle();
    _keyValueStorageService.resetKeys();
    _ref.invalidate(currentUserProvider);
  }
}
