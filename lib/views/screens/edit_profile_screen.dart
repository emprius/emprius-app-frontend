import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../utils/local_storage.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/user_appbar.dart';
import '../widgets/user_image_picker.dart';
import '../widgets/user_profile_image.dart';


class EditProfileScreen extends ConsumerStatefulWidget {
  final EditProfileArguments args;
  const EditProfileScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late UserModel user;

  TextEditingController teNameController = TextEditingController();

  @override
  void initState() {
    user = widget.args.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

/*    showModalBottomSheet(
      context: context,
      builder: ((builder) => const UserImagePicker()),
    );*/

    return Scaffold(
      appBar: UserAppbar("Editar perfil"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          // ProfileImage(
          //   avatar: user.avatar,
          //   isEdit: true,
          //
          //   // todo: extract logic to widget
          //   onClicked:  () async {
          //     final image = await ImagePicker()
          //         .pickImage(source: ImageSource.gallery);
          //
          //     if (image == null) return;
          //
          //     final directory = await getApplicationDocumentsDirectory();
          //     final name = basename(image.path);
          //     final imageFile = File('${directory.path}/$name');
          //     final newImage =
          //     await File(image.path).copy(imageFile.path);
          //
          //     setState(() => user = user.copy(avatar: newImage.path));
          //   },
          // ),
          const SizedBox(height: 20.0),
          TextFieldWidget(
            label: "Nom d'usuari",
            text: user.name,
            controller: teNameController,
            // onChanged: (name) =>
            //     ref.watch(userProvider.notifier).updateUser(
            //         user.copy(name: )
            //     ),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) => user = user.copy(email: email),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Localitzacio',
            text: user.location,
            onChanged: (location) => user = user.copy(location: location),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Guardar',
            onClicked: () {
              // UserPreferences.setUser(user);
              ref.watch(userProvider.notifier).updateUser(
                          user.copy(
                              name: teNameController.text
                          )
                      );

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
