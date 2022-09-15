import 'package:empriusapp/src/features/user/auth_user/domain/auth_state.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/core/routes.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((_) => checkAuthState());
  }

  void checkAuthState() {
    var authState = ref.watch(userProvider.notifier).authState;
    if (authState is UNAUTHENTICATED) {
      Navigator.pushReplacementNamed(context, loginScreenRoute);
    } else if (authState is AUTHENTICATED) {
      Navigator.pushReplacementNamed(context, userProfileScreenRoute, );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This is needed to rebuild when the state user is updated and run
    // checkAuthState again
    var user = ref.watch(userProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) => checkAuthState());

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
