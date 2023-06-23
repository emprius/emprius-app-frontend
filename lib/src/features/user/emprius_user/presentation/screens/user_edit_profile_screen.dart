import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/custom_circular_loader.dart';
import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/common_widgets/single_image_selector.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/core/helper/constants/widget_spacing.dart';
import 'package:empriusapp/src/core/helper/form_validator.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:empriusapp/src/features/user/emprius_user/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class UserEditProfileScreen extends ConsumerStatefulWidget {
  final EditProfileArguments args;

  const UserEditProfileScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _UserEditProfileScreenState();
}

//todo(kon): DRY this screen is pretty similar to register scren. May we coul use a provider
// to store the form state? Also the fields are repeated...
class _UserEditProfileScreenState extends ConsumerState<UserEditProfileScreen> {
  late UserModel user;

  // final _mapValidator =
  //     MapValidator(validator: FormValidator.locationNullValidator);
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _customMapCtrl = EmpriusMapController();

  bool _isHidden = true;
  late bool isActive;

  File? _avatarFile;

  void _setMarkers(LatLng newLatLng) {
    _customMapCtrl.markers = [
      CustomMarker.tapMarker(newLatLng)
      // Marker(
      //   point: newLatLng,
      //   builder: (ctx) =>  CustomMarker.tapMarker(tapLocation),
      // ),
    ];
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // todo(kon): DRY create a text snackbar object
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Canvis desats')),
      // );
      ref.read(profileProvider.notifier).updateUserProfile(
            name: _nameCtrl.text,
            email: _emailCtrl.text,
            active: isActive,
            location: _customMapCtrl.selectedLocation,
            avatar: _avatarFile,
          );
    }
  }

  void _onData(String message) {
    Navigator.pop(context);
    // todo(kon): DRY create custom scaffold messenger snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil actualitzat!')),
    );
  }

  @override
  void initState() {
    user = widget.args.user;
    _setMarkers(ref.read(currentUserProvider.notifier).state!.location!);
    _nameCtrl.text = user.name!;
    _emailCtrl.text = user.email;
    isActive = user.active!;
    _customMapCtrl.selectedLocation = user.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 20;

    ref.listen<FutureState<String>>(
      profileProvider,
      (_, profileState) => profileState.whenOrNull(
          data: _onData,
          failed: (reason) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${reason}')),
              )),
    );

    return Scaffold(
      appBar: UserAppbar("Editar perfil"),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        physics: const BouncingScrollPhysics(),
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // todo(kon): DRY avatar selector: use a separated widget for this that wrap gesture detector with modal bottom sheet and user profile avatar
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((builder) => SingleImageSelector((image) {
                                _avatarFile = image;
                                setState(() {});
                                Navigator.pop(context);
                              })));
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: UserProfileAvatar(
                        showBadge: true,
                        badgeIcon: Icons.camera_alt,
                        avatar: _avatarFile == null
                            ? ref.read(currentUserProvider)!.avatar
                            : _avatarFile!.path,
                      ),
                    ),
                  ),
                  Column(children: [
                    Switch(
                        value: isActive,
                        activeTrackColor: Colors.white10,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        }),
                    const SizedBox(height: 6.0),
                    Text(isActive ? "Perfil actiu" : "Perfil inactiu"),
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    Form.of(primaryFocus!.context!)!.save();
                  },
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          controller: _nameCtrl,
                          validator: FormValidator.nameValidator,
                          labelText: "Nom d'usuari",
                        ),
                        addVerticalSpace(20),
                        CustomTextField(
                          controller: _emailCtrl,
                          validator: FormValidator.emailValidator,
                          labelText: "E-mail",
                        ),
                        addVerticalSpace(20),
                        CustomTextField(
                          controller: _passwordCtrl,
                          validator: FormValidator.optionalPasswordValidator,
                          labelText: 'Mot de pas',
                          obscureText: _isHidden,
                          suffixIcon: IconButton(
                            icon: Icon(_isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                          ),
                        ),
                        addVerticalSpace(20),
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
                            icon: Icon(_isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                          ),
                        ),
                        addVerticalSpace(20),
                        selectLocationMap(user),
                        addVerticalSpace(20),
                        CustomTextButton(
                            text: 'DESAR',
                            builder: (context, ref, child) {
                              final profileState = ref.watch(profileProvider);
                              return profileState.maybeWhen(
                                loading: () => CustomCircularLoader(),
                                orElse: () => child!,
                              );
                            },
                            onClicked: _updateProfile),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget selectLocationMap(UserModel user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cambiar localitzacio:'),
          addVerticalSpace(6.0),
          Container(
            width: 280,
            height: 280,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: EmpriusMap(
                initialCenter: user.location,
                empriusMapController: _customMapCtrl),
          ),
        ],
      );
}
