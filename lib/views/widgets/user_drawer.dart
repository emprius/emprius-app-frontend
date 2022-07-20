import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';

class UserDrawer extends ConsumerStatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  createState() => _UserDrawerState();
}

class _UserDrawerState extends ConsumerState<UserDrawer> {

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(
                user.name,
                style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              accountEmail: Text(user.email),
            currentAccountPicture:
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/sharing.png"),
            ),
          ),
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
