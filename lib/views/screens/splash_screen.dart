import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/local_storage.dart';
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
    loadUserPreferences();
    super.initState();
  }

  Future<void> loadUserPreferences() async {
    await LocalStorage.init();
    var user = LocalStorage.getUser();
    if (user == null) {
      Navigator.pushReplacementNamed(context, loginScreenRoute);
    } else {
      ref.watch(userProvider.notifier).updateUser(user);
      Navigator.pushReplacementNamed(context, userProfileScreenRoute, );
    }
  }

  @override
  Widget build(BuildContext context) {
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
