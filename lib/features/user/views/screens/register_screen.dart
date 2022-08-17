import 'dart:io';
import 'package:empriusapp/core/helper/utils/constants.dart';
import 'package:empriusapp/core/helper/utils/form_validator.dart';
import 'package:empriusapp/core/helper/utils/map_validator.dart';
import 'package:empriusapp/core/widgets/common/bottom_image_selector.dart';
import 'package:empriusapp/core/widgets/common/custom_text_button.dart';
import 'package:empriusapp/core/widgets/common/custom_textfield.dart';
import 'package:empriusapp/core/widgets/common/profile_image_widget.dart';
import 'package:empriusapp/core/widgets/controllers/emprius_map_controller.dart';
import 'package:empriusapp/features/user/models/auth_state.dart';
import 'package:empriusapp/features/user/models/user_model.dart';
import 'package:empriusapp/features/user/providers/auth_state_provider.dart';
import 'package:empriusapp/features/user/providers/user_provider.dart';
import 'package:empriusapp/core/routes.dart';
import 'package:empriusapp/core/widgets/common/emprius_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _mapValidator = MapValidator(validator: FormValidator.locationNullValidator);
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _invitationCtrl = TextEditingController();
  final _customMapCtrl =  EmpriusMapController();

  late bool isActive = true;
  File? _avatar;

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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => BottomImageSelector((image) {
                                  _avatar = image;
                                  setState((){});
                                  Navigator.pop(context);
                                })),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ProfileImage(
                            showBadge: true,
                            badgeIcon: Icons.camera_alt,
                            avatar: _avatar == null ? defaultAvatar : _avatar!.path,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _emailCtrl,
                    validator: FormValidator.emailValidator,
                    labelText: "E-mail",
                    keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _invitationCtrl,
                    validator: FormValidator.invitationValidator,
                    labelText: 'Introduexi clau invitacio',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  selectLocationMap(),
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
                    onClicked: () async {
                      if (!_formKey.currentState!.validate() &&
                          !_mapValidator.validate()) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuari creat')),
                      );

                      await ref.watch(userProvider.notifier).register(
                          name: _nameCtrl.text,
                          email: _emailCtrl.text,
                          location: _customMapCtrl.selectedLocation!,
                          isActive: isActive,
                          password: _passwordCtrl.text,
                          invite: _invitationCtrl.text,
                          avatar:  _avatar?.path ?? ""
                      );

                      if (ref.watch(authStateProvider) is FAILED) {
                        // todo(kon): implement error show
                        return;
                      }

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

  Widget selectLocationMap() => Column(
        children: [
          const Text('Localitzacio actual:'),
          const SizedBox(height: 6.0),
          Container(
            width: 300,
            height: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: EmpriusMap(
              empriusMapController: _customMapCtrl,
            ),
          ),
        ],
      );
}
