

import 'package:empriusapp/features/user/models/auth_state.dart';
import 'package:empriusapp/features/user/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateProvider<AuthState>((ref) {
  var user = ref.watch(userProvider);
  if(user.isDummyUser) {
    return const AuthState.unauthenticated();
  } else if (user.id > 0) {
    return AuthState.authenticated(fullName: user.name!);
  }
  return const AuthState.unset();
});
