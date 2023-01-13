import 'package:empriusapp/src/core/routes.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
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
