import 'dart:convert';

import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/local/key_value_storage_service.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/user/auth_user/data/auth_repository.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final currentUserProvider = StateProvider<UserModel?>((ref) => null);

final authProvider = StateNotifierProvider<AuthProvider, FutureState<bool?>>(
  (ref) {
    final _authRepository = ref.watch(authRepositoryProvider);
    final _keyValueStorageService = ref.watch(keyValueStorageServiceProvider);
    return AuthProvider(
      ref,
      authRepository: _authRepository,
      keyValueStorageService: _keyValueStorageService,
    );
  },
);

class AuthProvider extends StateNotifier<FutureState<bool?>> {
  final AuthRepository _authRepository;
  final KeyValueStorageService _keyValueStorageService;
  final Ref _ref;

  AuthProvider(
    this._ref, {
    required AuthRepository authRepository,
    required KeyValueStorageService keyValueStorageService,
  })  : _authRepository = authRepository,
        _keyValueStorageService = keyValueStorageService,
        super(const FutureState.idle());

  Future<void> loadUserAuthDataInMemory() async {
    final student = _keyValueStorageService.getAuthUser();
    final password = await _keyValueStorageService.getAuthPassword();
    if (student != null && password.isNotEmpty) {
      _ref.read(currentUserProvider.notifier).state = student;
      state = const FutureState.data(data: true);
    }
  }

  void cacheAuthProfile(UserModel student) {
    _keyValueStorageService.setAuthUser(student);
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
    String? avatar,
  }) async {
    state = const FutureState.loading();

    // final registerFormProv = _ref.read(
    //   registerFormProvider.notifier,
    // );
    // final personalData = registerFormProv.savedPersonalDetails!;
    // final uniData = registerFormProv.savedUniversityDetails!;

    // final data = StudentModel(
    //   erp: personalData.erp,
    //   firstName: personalData.firstName,
    //   lastName: personalData.lastName,
    //   gender: personalData.gender,
    //   uniEmail: personalData.uniEmail,
    //   contact: personalData.contact.startsWith('0')
    //       ? '+92${personalData.contact.substring(1)}'
    //       : personalData.contact,
    //   birthday: personalData.birthday,
    //   profilePictureUrl:
    //       'https://firebasestorage.googleapis.com/v0/b/unipal-frontend.appspot.com/o/default-avatar.png?alt=media&token=0d2f3f8d-b179-4803-a21f-e745b3568120',
    //   graduationYear: uniData.gradYear,
    //   programId: uniData.program.programId,
    //   campusId: uniData.campus.campusId,
    //   isActive: true,
    // ).toJson();
    // data['password'] = password;

      final userData = UserModel(
        name: name ,
        email: email ,
        location: location ,
        isActive: isActive ,
        avatar: avatar,
      );

    final data = userData.toJson();
    data['password'] = password;
    data['invite'] = invite;

    state = await FutureState.makeGuardedRequest(() async {
      final student = await _authRepository.sendRegisterData(
        data: data,
        updateTokenCallback: _cacheAuthToken,
      );

      // Update current user in memory
      _ref.read(currentUserProvider.notifier).state = student;

      // Save authentication details in cache
      cacheAuthProfile(student);
      _cacheAuthPassword(password);

      return true;
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const FutureState.loading();

    final data = {'email': email, 'password': password};

    state = await FutureState.makeGuardedRequest(() async {
      final student = await _authRepository.sendLoginData(
        data: data,
        updateTokenCallback: _cacheAuthToken,
      );

      // Update current user in memory
      _ref.read(currentUserProvider.notifier).state = student;

      // Save authentication details in cache
      cacheAuthProfile(student);
      _cacheAuthPassword(password);

      return true;
    });
  }

  void logout() {
    _keyValueStorageService.resetKeys();
    state = const FutureState.idle();
    _ref.invalidate(currentUserProvider);
  }
}
