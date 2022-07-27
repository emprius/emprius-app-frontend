import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/local_storage.dart';
import 'package:empriusapp/views/widgets/button_widget.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_image_picker.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:empriusapp/views/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return Scaffold(
      appBar: UserAppbar("El meu perfil"),
      body: ListView(
       physics: const BouncingScrollPhysics(),
       children: [
         ProfileImage(
             avatar: user.avatar,
             onClicked: () async {
               await Navigator.pushNamed(context, editProfileScreenRoute, arguments: EditProfileArguments(user));
             },
         ),
         const SizedBox(height: 20.0),
         buildName(user),
         const SizedBox(height: 20.0),
         buildLocation(user),
         const SizedBox(height: 20.0),
         ButtonWidget(
             text: "Les meves eiens",
             onClicked: () {
               Navigator.pushNamed(context, userToolsScreenRoute);
             }),
       ],
     ),
    );
  }

  Widget buildName(UserModel user)=>Column(
    children: [
      Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildLocation(UserModel user)=>Wrap(
    children: [
      const Text('Localitzacio actual:'),
      Container(
        width: 250,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: UserMap(),
      ),
    ],
  );
}



