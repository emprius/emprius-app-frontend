import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
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
    var user = ref.watch(currentUserProvider)!;

    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, userProfileScreenRoute);
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                /*image: DecorationImage(
                  alignment: Alignment.centerRight,
                    image: AssetImage('assets/logos/logo.png'),
                  fit: BoxFit.contain,
                ),*/
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xFF3D6657),
                        Color(0xFFE7E885).withOpacity(0.8),
                      ]
                  )
              ),
                accountName: Text(
                  user.name!,
                  style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                accountEmail: Text(user.email),
              currentAccountPicture: const CurrentUserAvatar()
            ),
          ),
          ListTile(
            leading: Icon(Icons.search_sharp),
            title: Text("Cerca eines"),
            onTap: () {
              Navigator.pushReplacementNamed(context, searchMapScreenRoute);
            },
          ),
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
          const Divider(
            height: 6,
            color: Colors.black,
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracio"),
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text("Tancar sessio"),
            onTap: () {
              // todo(kon): use better navigation: use pop until and let the widgets move you until profile screen
              Navigator.pushReplacementNamed(context, initialRoute);
              ref
                  .read(authProvider.notifier)
                  .logout();
            },
          ),
        ],
      ),
    );
  }
}
