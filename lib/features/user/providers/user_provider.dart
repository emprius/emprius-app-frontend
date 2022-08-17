import 'package:empriusapp/core/services/storage/storage_service_provider.dart';
import 'package:empriusapp/features/user/models/user_model.dart';
import 'package:empriusapp/features/user/repository/user_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  final _userStorageRepository = UserStorageRepository(
      storageServiceProvider: ref.watch(storageServiceProvider)
  );
  return UserNotifier(userStorageRepository: _userStorageRepository);
});

// The public methods on this class will be what allow the UI to modify the state.
class UserNotifier extends StateNotifier<UserModel> {

  final UserStorageRepository _userStorageRepository;
  UserNotifier({
      required UserStorageRepository userStorageRepository,
  }) : _userStorageRepository = userStorageRepository,
  super(UserModel.initial()) {
    init();
  }

  void init() async {
    final user = await _userStorageRepository.getUser();
    if(user != null) state = user;
  }

  Future<void> updateUser(UserModel user) async {

    // todo: implement dio user repository
    // put emprius/user -> Ok 200

    // Actualitzas lestate de la app
    state = user;
    // Persist the user data
    await _userStorageRepository.setUser(user);

  }
}