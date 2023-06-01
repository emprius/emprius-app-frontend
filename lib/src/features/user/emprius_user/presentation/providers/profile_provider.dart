import 'dart:io';

import 'package:empriusapp/src/core/services/networking/custom_exception.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/data/users_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<String> updateUserProfile(
     UserModel user, [String? password]
  ) async {

    final data = user.toJson();

    if (password != null) data["password"] = password;

    if (data.isEmpty) {
      throw CustomException(message: 'Nothing to update!');
    }

    // final erp = _read(authProvider)!.erp;

    // Make request
    final message = await _usersRepository.update(data: data);

    return message;
  }
}
