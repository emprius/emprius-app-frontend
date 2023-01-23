import 'package:empriusapp/src/core/helper/utils/constants.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_profile_avatar.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, userProfileScreenRoute);
            },
            child: UserAccountsDrawerHeader(
              /*decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logos/logo.png"),
                      fit: BoxFit.cover)
              ),*/
                accountName: Text(
                  user.name!,
                  style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                accountEmail: Text(user.email),
              currentAccountPicture: UserProfileAvatar(
                avatar: user.avatar!.isEmpty ? defaultAvatar : user.avatar!,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search_sharp),
            title: Text("Cerca eines"),
            onTap: () {
              Navigator.pushReplacementNamed(context, searchMapScreenRoute);
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text("El meu perfil"),
          //   onTap: (){
          //     Navigator.pushReplacementNamed(context, userProfileScreenRoute);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.workspaces_sharp),
            title: Text("La meva activitat"),
            onTap: (){
              Navigator.pushReplacementNamed(context, userActivityScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_graph_outlined),
            title: Text("Historial d'us"),
            onTap: (){
              Navigator.pushReplacementNamed(context, userStoryScreenRoute);
            },
          ),
          Divider(
            height: 6,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracio"),
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
