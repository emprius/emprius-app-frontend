//import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/providers/map_providers.dart';
import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/widgets/common/custom_text_button.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empriusapp/utils/form_validator.dart';

import '../widgets/common/bottom_image_selector.dart';
import '../widgets/common/custom_textfield.dart';
import '../widgets/profile_image_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late UserModel user;
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _invitationCtrl = TextEditingController();
  late bool isActive = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _cPasswordCtrl.dispose();
    _invitationCtrl.dispose();
    super.dispose();
  }

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _nameCtrl,
                          validator: FormValidator.nameValidator,
                          labelText: "Nom d'usuari",
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showModalBottomSheet(
                      //         context: context,
                      //         builder: ((builder) => BottomImageSelector((image) {
                      //           if (image != null) {
                      //             user = user.copy(avatar: image.path);
                      //             setState(() {});
                      //           }
                      //           Navigator.pop(context);
                      //         })));
                      //   },
                      //   child: SizedBox(
                      //     height: 100,
                      //     width: 100,
                      //     child: ProfileImage(avatar: user.avatar),
                      //   ),
                      // ),
                    ],
                  ),
                  CustomTextField(
                    controller: _emailCtrl,
                    validator: FormValidator.emailValidator,
                    labelText: "E-mail",
                  ),
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
                  CustomTextField(
                    controller: _cPasswordCtrl,
                    validator: (value) =>
                        FormValidator.confirmPasswordValidator(
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
                  CustomTextField(
                    controller: _invitationCtrl,
                    validator: FormValidator.invitationValidator,
                    labelText: 'Introduexi clau invitacio',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildLocation(user),
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
                  CustomTextButton(
                    text: 'Finalitza registre',
                    onClicked: () {
                      if (!_formKey.currentState!.validate()) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuari creat')),
                      );

                      ref.watch(userProvider.notifier).updateUser(UserModel(
                            id: 1,
                            name: _nameCtrl.text,
                            email: _emailCtrl.text,
                            password: _passwordCtrl.text,
                            invitation: _invitationCtrl.text,
                            location:
                                (ref.read(userMapProvider)).first.toString(),
                          ));

                      Navigator.pushReplacementNamed(
                          context, userProfileScreenRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLocation(UserModel user)=>Column(
    children: [
      const Text('Localitzacio actual:'),
      const SizedBox(height: 6.0),
      Container(
        width: 300,
        height: 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ),
        child: UserMap(),
      ),
    ],
  );

}
