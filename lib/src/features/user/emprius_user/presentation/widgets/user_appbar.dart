import 'package:empriusapp/src/core/routes.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  //const UserAppbar({Key? key}) : super(key: key);
  String title;
  //bool goToMap = true;
  UserAppbar(this.title);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 20,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
