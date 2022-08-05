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
import '../../services/local_storage.dart';
import '../widgets/common/custom_text_button.dart';
import '../widgets/common/custom_textfield.dart';
import '../widgets/user_appbar.dart';
import '../widgets/common/bottom_image_selector.dart';
import '../widgets/custom_map.dart';
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
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _customMapCtrl =
      CustomMapController(validator: FormValidator.locationNullValidator);

  late bool isActive = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _cPasswordCtrl.dispose();
    super.dispose();
  }

  bool _isHidden = true;

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ProfileImage(
                          avatar: user.avatar,
                          showBadge: true,
                        ),
                      ),
                    ),
                    Column(children: [
                      Switch(
                          value: user.isActive,
                          activeTrackColor: Colors.white10,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              // user!.isActive = value;
                            });
                          }),
                      const SizedBox(height: 6.0),
                      Text(user.isActive ? "Perfil actiu" : "Perfil inactiu"),
                    ]),
                  ],
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _nameCtrl,
                  validator: FormValidator.nameValidator,
                  labelText: "Nom d'usuari",
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _emailCtrl,
                  validator: FormValidator.emailValidator,
                  labelText: "E-mail",
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _passwordCtrl,
                  validator: FormValidator.passwordValidator,
                  labelText: 'Mot de pas',
                  obscureText: _isHidden,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _cPasswordCtrl,
                  validator: (value) => FormValidator.confirmPasswordValidator(
                    value,
                    _passwordCtrl.text,
                  ),
                  labelText: 'Confirmar mot de pas',
                  obscureText: _isHidden,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                selectLocationMap(user),
                const SizedBox(height: 24),
                CustomTextButton(
                  text: 'Desar',
                  onClicked: () async {
                    if (!_formKey.currentState!.validate() &&
                        !_customMapCtrl.validate()) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Canvis desats')),
                    );

                    await ref
                        .watch(userProvider.notifier)
                        .updateUser(user.copy(
                          name: _nameCtrl.text,
                          email: _emailCtrl.text,
                          location: _customMapCtrl.selectedLocation!,
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

  Widget selectLocationMap(UserModel user) => Column(
        children: [
          const Text('Cambiar localitzacio:'),
          const SizedBox(height: 6.0),
          Container(
            width: 300,
            height: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomMap(
                controller: _customMapCtrl
            ),
          ),
        ],
      );
}
