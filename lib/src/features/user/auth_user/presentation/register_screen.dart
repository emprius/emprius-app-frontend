import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/custom_circular_loader.dart';
import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/common_widgets/single_image_selector.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/helper/form_validator.dart';
import 'package:empriusapp/src/core/helper/map_validator.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _mapValidator =
      MapValidator(validator: FormValidator.locationNullValidator);
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _invitationCtrl = TextEditingController();
  final _customMapCtrl = EmpriusMapController();

  late bool isActive = true;
  File? _avatarFile;

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    void onData(bool? isAuthenticated) {
      if (isAuthenticated != null && isAuthenticated) {
        Navigator.pushReplacementNamed(context, userProfileScreenRoute);
      }
    }

    ref.listen<FutureState<bool?>>(
      authProvider,
      (_, authState) => authState.whenOrNull(
          data: onData,
          failed: (reason) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error en el procés de registre')),
              )),
    );
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
                      // todo(kon): use a separated widget for this that wrap gesture detector with modal bottom sheet and user profile avatar
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => SingleImageSelector((image) {
                                  _avatarFile = image;
                                  setState(() {});
                                  Navigator.pop(context);
                                })),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: UserProfileAvatar(
                            showBadge: true,
                            badgeIcon: Icons.camera_alt,
                            // avatar: defaultAvatar,
                            avatar: _avatarFile == null
                                ? defaultAvatar
                                : _avatarFile!.path,
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
                  // Todo(kon): move this to a separated widget or named constructor to DRY
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
                      onChanged: (value) {
                        setState(() {
                          isActive = value;
                        });
                      }),
                  CustomTextButton(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final authState = ref.watch(authProvider);
                      return authState.maybeWhen(
                        loading: () => CustomCircularLoader(),
                        orElse: () => child!,
                      );
                    },
                    text: 'Finalitza registre',
                    onClicked: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      ref.read(authProvider.notifier).register(
                          name: _nameCtrl.text,
                          email: _emailCtrl.text,
                          location: _customMapCtrl.selectedLocation,
                          isActive: isActive,
                          password: _passwordCtrl.text,
                          invite: _invitationCtrl.text,
                          avatar: _avatarFile);
                    },
                  ),
                  // Consumer(
                  //   builder:
                  //       (BuildContext context, WidgetRef ref, Widget? child) {
                  //     final authState = ref.watch(authProvider);
                  //     return authState.maybeWhen(
                  //       loading: () => CustomCircularLoader(),
                  //       orElse: () => child!,
                  //     );
                  //   },
                  //   child: CustomTextButton(
                  //     text: 'Finalitza registre',
                  //     onClicked: () async {
                  //       if (!_formKey.currentState!.validate()) {
                  //         return;
                  //       }
                  //
                  //       ref.read(authProvider.notifier).register(
                  //           name: _nameCtrl.text,
                  //           email: _emailCtrl.text,
                  //           location: _customMapCtrl.selectedLocation,
                  //           isActive: isActive,
                  //           password: _passwordCtrl.text,
                  //           invite: _invitationCtrl.text,
                  //           avatar: _avatarFile);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void registerSuccess() {
  //   Navigator.pushReplacementNamed(
  //       context, userProfileScreenRoute);
  // }

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
