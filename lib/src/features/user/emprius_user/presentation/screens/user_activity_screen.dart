import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserActivityScreen extends ConsumerStatefulWidget {
  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserActivityState();
}

class _UserActivityState extends ConsumerState<UserActivityScreen> {

  @override
  Widget build(BuildContext context) {
    //var user = ref.watch(userProvider);
    //final user = UserPreferences.getUser();

    return Scaffold(
      appBar: UserAppbar("La meva activitat"),
      body: Container(
        color: Colors.teal,
      )
    );
  }
}



