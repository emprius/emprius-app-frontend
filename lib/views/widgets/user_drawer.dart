import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/material.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture:
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/sharing.png"),
              ),
              accountName: Text("Kone Jo"),
              accountEmail: Text("croto@mail.com")),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("El meu perfil"),
            onTap: (){
              Navigator.pushNamed(context, userProfileScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.workspaces_sharp),
            title: Text("La meva activitat"),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text("Missatges"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracio"),
          ),
          Divider(
            height: 6,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text("Tancar sessio"),
          ),
        ],
      ),
    );
  }
}
