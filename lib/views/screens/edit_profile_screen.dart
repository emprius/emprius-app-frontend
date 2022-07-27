import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../utils/form_validator.dart';
import '../../utils/local_storage.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/user_appbar.dart';
import '../widgets/bottom_image_selector.dart';
import '../widgets/user_map.dart';
import '../widgets/profile_image_widget.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final EditProfileArguments args;

  const EditProfileScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late UserModel user;
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  late bool isActive = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    user = widget.args.user;
    _nameCtrl.text = user.name;
    _emailCtrl.text = user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: UserAppbar("Editar perfil"),
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => BottomImageSelector((image) {
                              if (image != null) {
                                user = user.copy(avatar: image.path);
                                setState(() {});
                              }
                              Navigator.pop(context);
                            })));
                  },
                  child: ProfileImage(
                    avatar: user.avatar,
                    showBadge: true,

                    // onSelected: (file) {
                    //   if(file!=null) {
                    //     user = user.copy(avatar: file.path);
                    //     setState((){});
                    //   }
                    //},
                    // onClicked:  () async {
                    //   final image = await ImagePicker()
                    //       .pickImage(source: ImageSource.gallery);
                    //
                    //   if (image == null) return;
                    //
                    //   final directory = await getApplicationDocumentsDirectory();
                    //   final name = basename(image.path);
                    //   final imageFile = File('${directory.path}/$name');
                    //   final newImage =
                    //   await File(image.path).copy(imageFile.path);
                    //
                    //   setState(() => user = user.copy(avatar: newImage.path));
                    // },
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nom d'usuari",
                  ),
                  validator: FormValidator.nameValidator,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailCtrl,
                  validator: FormValidator.emailValidator,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "E-mail",
                  ),
                ),
                const SizedBox(height: 24),
                const Text("Localitza't al mapa:"),
                //todo get latlng from widget map and pass it to profile screen:
                SizedBox(height: 250, child: UserMap()),
                const SizedBox(
                  height: 20.0,
                ),
                SwitchListTile(
                    title: Text(isActive ? "Perfil actiu" : "Perfil inactiu"),
                    value: isActive,
                    activeTrackColor: Colors.white10,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    }),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Guardar',
                  onClicked: () {
                    if (!_formKey.currentState!.validate()) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Canvis desats')),
                    );

                    ref.watch(userProvider.notifier).updateUser(user.copy(
                          name: _nameCtrl.text,
                          email: _emailCtrl.text,
                        ));

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
