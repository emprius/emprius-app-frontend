import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppbar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Emprius app"),
      centerTitle: true,
      elevation: 20,
      toolbarHeight: 100,
      //leading: Icon(Icons.arrow_back, color: Colors.white),
      actions: [
        IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, homeScreenRoute);
          },
          icon: const Icon(Icons.house),
        ),
        PopupMenuButton(
            elevation: 30,
            //shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 10)),
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text("share")),
              const PopupMenuItem(value: 2, child: Text("get link")),
            ])
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
