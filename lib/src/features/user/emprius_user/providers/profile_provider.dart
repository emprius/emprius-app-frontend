import 'dart:io';

import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/images/helpers/utils.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/data/users_repository.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final profileProvider =
    StateNotifierProvider<ProfileProvider, FutureState<String>>(
  (ref) {
    final _usersRepository = ref.watch(usersRepositoryProvider);
    return ProfileProvider(
      ref.read,
      usersRepository: _usersRepository,
    );
  },
);

class ProfileProvider extends StateNotifier<FutureState<String>> {
  final Reader _read;
  final UsersRepository _usersRepository;

  ProfileProvider(
    this._read, {
    required UsersRepository usersRepository,
  })  : _usersRepository = usersRepository,
        super(const FutureState.idle());

  Future<void> updateUserProfile({
    String? name,
    String? email,
    String? password,
    bool? active,
    LatLng? location,
    File? avatar,
  }) async {
    state = const FutureState.loading();
    final user = UserModel(
      name: name,
      email: email ?? "",
      location: location,
      active: active,
    );
    final data = user.toJson();

    // todo(kon): Check if information to update is different to current user
    // See toUpdateJson on uniPal repo to get inspired
    // if (data.isEmpty && password == null) {
    //   throw CustomException(message: 'Nothing to update!');
    // }

    if (password != null) data["password"] = password;

    if (avatar != null) {
      data['avatar'] = imageToBase64(avatar);
    }

    state = await FutureState.makeGuardedRequest(() async {
      final updatedUser = await _usersRepository.update(data: data);
      // Update current user in memory
      _read(currentUserProvider.notifier).state = updatedUser;
      // Save authentication details in cache
      _read(authProvider.notifier).cacheAuthProfile(updatedUser);
      if (password != null) {
        _read(authProvider.notifier).cacheAuthPassword(password);
      }
      return "success";
    });
  }
}
