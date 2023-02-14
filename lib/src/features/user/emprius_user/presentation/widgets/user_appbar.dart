import 'package:empriusapp/src/core/helper/utils/widget_spacing.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  //const UserAppbar({Key? key}) : super(key: key);
  String title;
  //bool goToMap = true;
  UserAppbar(this.title);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
          children: [
            Image(image: AssetImage('assets/logos/logo.png'), height: 30),
            addHorizontalSpace(10),
            Text(title),
      ],),
      centerTitle: true,
      elevation: 20,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xFF606042), Color(0xFF3D6657), ]
          )
        ),
      ),
      // toolbarHeight: 70,
      //leading: Icon(Icons.arrow_back, color: Colors.white),

      // actions: [
      //   Visibility(
      //     //visible: goToMap,
      //     child: IconButton(
      //     color: Colors.white,
      //       icon: const Icon(Icons.house),
      //       onPressed: () {
      //         Navigator.pushNamed(context, searchMapScreenRoute);
      //       },
      //     ),
      //   ),
      //   // PopupMenuButton(
      //   //     elevation: 30,
      //   //     //shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 10)),
      //   //     icon: Icon(Icons.more_vert),
      //   //     itemBuilder: (context) => [
      //   //       const PopupMenuItem(value: 1, child: Text("les meves eines")),
      //   //     ])
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
