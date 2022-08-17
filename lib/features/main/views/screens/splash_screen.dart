import 'package:empriusapp/features/user/models/auth_state.dart';
import 'package:empriusapp/features/user/providers/auth_state_provider.dart';
import 'package:empriusapp/features/user/providers/user_provider.dart';
import 'package:empriusapp/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> checkAuthState() async {
    final authState = ref.watch(authStateProvider);
    authState.maybeWhen(
      authenticated: (fullName) => Navigator.pushReplacementNamed(context, userProfileScreenRoute, ),
      unauthenticated: ( ) => Navigator.pushReplacementNamed(context, loginScreenRoute),
      orElse: () {  },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => checkAuthState());

    final authState = ref.watch(authStateProvider);
    final userProvid = ref.watch(userProvider.notifier);

    print("AuthState");

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
