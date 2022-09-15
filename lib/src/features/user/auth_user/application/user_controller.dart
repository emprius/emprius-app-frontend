import 'package:empriusapp/src/features/user/auth_user/data/user_http_repository.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_storage_repository.dart';
import 'package:empriusapp/src/features/user/auth_user/domain/auth_state.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


// The public methods on this class will be what allow the UI to modify the state.
class UserController extends StateNotifier<UserModel> {

  AuthState authState = const AuthState.unset();
  final UserStorageRepository _userStorageRepository;
  final UserHttpRepository _userHttpRepository;

  UserController({
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
      state = UserModel.initial().copyWith(id: 0);  // Perform a state update to update authState also
    }
  }

  Future<void> updateUser(UserModel user, String password) async {

    // todo(kon): implement dio user repository
    // put emprius/user -> Ok 200

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