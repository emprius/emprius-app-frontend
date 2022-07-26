//import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/providers/map_providers.dart';
import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empriusapp/utils/form_validator.dart';

import '../widgets/user_image_picker.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
                        child: TextFormField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nom d'usuari",
                          ),
                          validator: FormValidator.nameValidator,
                        ),
                      ),
                      const Icon(
                        Icons.person,
                        size: 50.0,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => const UserImagePicker()),
                            //todo Pop and pass image from widget
                          );
                        },
                        child: const Icon(
                          Icons.camera_alt_rounded,
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: _emailCtrl,
                    validator: FormValidator.emailValidator,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "E-mail",
                    ),
                  ),
                  TextFormField(
                    controller: _passwordCtrl,
                    validator: FormValidator.passwordValidator,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Mot de pas",
                      suffixIcon: IconButton(
                        icon: Icon( _isHidden ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _cPasswordCtrl,
                    validator: (value) => FormValidator.confirmPasswordValidator(
                      value,
                      _passwordCtrl.text,
                    ),
                    obscureText: true,
                    decoration:
                    InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Confirmar mot de pas",
                      suffixIcon: IconButton(
                        icon: Icon( _isHidden ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _invitationCtrl,
                    validator: FormValidator.invitationValidator,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Introdueix clau d'invitacio",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                  ElevatedButton(
                    child: const Text('Finalitza registre'),
                    onPressed: () {
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
                            location: (ref.read(userMapProvider)).first.toString(),
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
}
