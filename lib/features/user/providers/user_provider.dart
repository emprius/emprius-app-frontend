import 'package:empriusapp/core/helper/utils/constants.dart';
import 'package:empriusapp/core/services/storage/local_storage.dart';
import 'package:empriusapp/features/user/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


final userProvider = StateNotifierProvider<UserNotifier, UserModel>(
(ref) => UserNotifier());

// The public methods on this class will be what allow the UI to modify the state.
class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(
      UserModel(
          id: 0,
          email: "email",
          password: "password",
          invitation: "invitation",
          location: defaultMapCenter));

  Future<void> updateUser(UserModel user) async {

    // 1. Actualizar en el servidor usando el service
    // put emprius/user -> Ok 200

    // Actualitzas lestate de la app
    state = user;
    // Actualitzes la persistencia per tenir les dades guardades
    await LocalStorage.setUser(user);

  }
}