import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/user_appbar.dart';
import '../widgets/user_profile_image.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);


    return Scaffold(
      appBar: const UserAppbar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileImage(
            avatar: user.avatar,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 20.0),
          TextFieldWidget(
            label: "Nom d'usuari",
            text: user.name,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Localitzacio',
            text: user.location,
            onChanged: (localitzacio) {},
          ),
        ],
      ),
    );
  }
}
