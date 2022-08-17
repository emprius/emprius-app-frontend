

import 'package:empriusapp/features/user/models/auth_state.dart';
import 'package:empriusapp/features/user/models/enums/user_auth_state.dart';
import 'package:empriusapp/features/user/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateProvider<AuthState>((ref) {
  return ref.watch(userProvider.notifier).authState;
});
