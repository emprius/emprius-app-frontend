import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserStoryScreen extends ConsumerStatefulWidget {
  const UserStoryScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserStoryState();
}

class _UserStoryState extends ConsumerState<UserStoryScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar(title: "Historial d'us", ),
        drawer: UserDrawer(),
      body: Container(
        color: Colors.teal,
      )
    );
  }
}



