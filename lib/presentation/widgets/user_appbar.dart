import 'package:empriusapp/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  //const UserAppbar({Key? key}) : super(key: key);
  String title;
  UserAppbar(this.title);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 20,
      // toolbarHeight: 70,
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
              const PopupMenuItem(value: 1, child: Text("les meves eines")),
            ])
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
