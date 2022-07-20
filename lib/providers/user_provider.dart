import 'package:empriusapp/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          location: "location"));
}