import 'package:empriusapp/core/services/storage/storage_service_provider.dart';
import 'package:empriusapp/features/user/models/auth_state.dart';
import 'package:empriusapp/features/user/models/enums/user_auth_state.dart';
import 'package:empriusapp/features/user/models/user_model.dart';
import 'package:empriusapp/features/user/providers/auth_state_provider.dart';
import 'package:empriusapp/features/user/repository/user_http_repository.dart';
import 'package:empriusapp/features/user/repository/user_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final _userHttpProvider = Provider<UserHttpRepository>((ref) {
  // todo(kon): implement http service provider
  // final _apiService = ref.watch(_apiServiceProvider);
  // return UserHttpRepository(apiService: _apiService);
  return UserHttpRepository();
});



final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  final _userStorageRepository = UserStorageRepository(
      storageServiceProvider: ref.watch(storageServiceProvider)
  );
  final _userHttpRepository =  ref.watch(_userHttpProvider);
  return UserNotifier(
      userStorageRepository: _userStorageRepository,
      userHttpRepository: _userHttpRepository
  );
});

// The public methods on this class will be what allow the UI to modify the state.
class UserNotifier extends StateNotifier<UserModel> {

  AuthState authState = const AuthState.unset();

  final UserStorageRepository _userStorageRepository;
  final UserHttpRepository _userHttpRepository;

  UserNotifier({
    required UserStorageRepository userStorageRepository,
    required UserHttpRepository userHttpRepository,
  }) :
        _userStorageRepository = userStorageRepository,
        _userHttpRepository = userHttpRepository,
        super(UserModel.initial()) {
    init();
  }

  void init() async {
    final user = await _userStorageRepository.getUser();
    if(user != null) {
      authState = AuthState.authenticated(fullName: user.name!);
      state = user;
    } else {
      authState = const AuthState.unauthenticated();
    }
  }

  Future<void> updateUser(UserModel user) async {

    // todo: implement dio user repository
    // put emprius/user -> Ok 200

    // Actualitzas lestate de la app
    state = user;
    // Persist the user data
    await _userStorageRepository.setUser(user);

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
    final user = UserModel(
      name: name ,
      email: email ,
      location: location ,
      isActive: isActive ,
      avatar: avatar,
    );
    authState = const AuthState.authenticating();
    state = user;
    try {
      var registeredUser = await _userHttpRepository.register(
        userData: user,
        invite: invite,
        password: password,
      );
      authState = AuthState.authenticated(fullName: registeredUser.name!);
      state = registeredUser;
      _userStorageRepository.setUser(state);
    }  catch (e) {
      authState = AuthState.failed(reason: e.toString());
      state = UserModel.initial();
    }
  }

}