import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';
import '../../utils/constants.dart';

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
                user.name!,
                style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              accountEmail: Text(user.email),
            currentAccountPicture: ProfileImage(
              avatar: user.avatar!.isEmpty ? defaultAvatar : user.avatar!,
            ),

            // const CircleAvatar(
            //   backgroundImage: AssetImage("assets/images/sharing.png"),
            // ),
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
            onTap: (){
              Navigator.pushNamed(context, userActivityScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text("Missatges"),
            onTap: (){
              Navigator.pushNamed(context, userInboxScreenRoute);
            },
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
