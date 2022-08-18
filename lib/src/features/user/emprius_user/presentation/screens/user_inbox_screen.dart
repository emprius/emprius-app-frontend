import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/user_inbox_navbar.dart';

class UserInboxScreen extends ConsumerStatefulWidget {
  const UserInboxScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserInboxState();
}

class _UserInboxState extends ConsumerState<UserInboxScreen> {
  int currentIndex = 0;
  onTab(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar("Missatges"),
      body: ListView(),
      bottomNavigationBar: UserInboxNavbar(onTab, currentIndex),
    );
  }
}
