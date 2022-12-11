import 'package:empriusapp/src/core/common_widgets/single_image_selector.dart';
import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/constants.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/helper/utils/map_validator.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


class UserEditProfileScreen extends ConsumerStatefulWidget {
  final EditProfileArguments args;
  const UserEditProfileScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _UserEditProfileScreenState();
}

class _UserEditProfileScreenState extends ConsumerState<UserEditProfileScreen> {
  late UserModel user;
  final _mapValidator = MapValidator(validator: FormValidator.locationNullValidator);
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cPasswordCtrl = TextEditingController();
  final _customMapCtrl = EmpriusMapController();

  bool _isHidden = true;
  late bool isActive;

  void _setMarkers(LatLng newLatLng){
    _customMapCtrl.markers = [
      CustomMarker.tapMarker(newLatLng)
      // Marker(
      //   point: newLatLng,
      //   builder: (ctx) =>  CustomMarker.tapMarker(tapLocation),
      // ),
    ];
  }


  @override
  void initState() {
    user = widget.args.user;
    _setMarkers( ref.read(userProvider.notifier).state.location!);
    _nameCtrl.text = user.name!;
    _emailCtrl.text = user.email;
    isActive = user.isActive!;
    _customMapCtrl.selectedLocation = user.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: UserAppbar("Editar perfil"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          physics: const BouncingScrollPhysics(),
          
          child: Shortcuts(
            shortcuts: const <ShortcutActivator,Intent>{
              SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
            },
            child: FocusTraversalGroup(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => SingleImageSelector((image) {
                                      if (image != null) {
                                        user = user.copyWith(avatar: image.path);
                                        setState(() {});
                                      }
                                      Navigator.pop(context);
                                    })));
                          },
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: UserProfileAvatar(
                              avatar: user.avatar!.isEmpty ? defaultAvatar : user.avatar!,
                              showBadge: true,
                            ),
                          ),
                        ),
                        Column(children: [
                          Switch(
                              value: isActive,
                              activeTrackColor: Colors.white10,
                              activeColor: Colors.blue,
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
                      validator: FormValidator.optionalPasswordValidator,
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
                      //Unhandled Exception: Null check operator used on a null value
                      onClicked: () async {
                        if (!_formKey.currentState!.validate())
                          //TODO if not selectedlocation doesnt navigate:
                          //&& !_customMapCtrl.validate())
                        {
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Canvis desats')),
                        );

                        await ref
                            .watch(userProvider.notifier)
                            .updateUser(
                          user.copyWith(
                            name: _nameCtrl.text,
                            email: _emailCtrl.text,
                            isActive: isActive,
                            location: _customMapCtrl.selectedLocation!,
                          ),
                          _passwordCtrl.text,
                        );
                        if (!mounted) return;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
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
            child: EmpriusMap(
              initialCenter: user.location,
                empriusMapController: _customMapCtrl

            ),
          ),
        ],
      );
}
