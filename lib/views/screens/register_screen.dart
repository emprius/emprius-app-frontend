//import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/screens/user_profile_screen.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final _invitationCtrl = TextEditingController();
  late bool isActive = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _invitationCtrl.dispose();
    super.dispose();
  }

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
                            labelText: "Nom d'usuari",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Aquest camp es requerit";
                            }
                            return null;
                          },
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration:
                        const InputDecoration(labelText: "Correu electronic"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Mot de pas"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aquest camp es requerit";
                      } else if (value.length < 8) {
                        return "El mot de pas ha de tenir minim 8 caracters";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: "Repetir mot de pas"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aquest camp es requerit";
                      } else if (value != _passwordCtrl.text) {
                        return "El mot de pas no coincideix";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _invitationCtrl,
                    decoration: const InputDecoration(
                        labelText: "Introdueix clau d'invitacio"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Localitza't al mapa:"),
                  const SizedBox(height: 250, child: UserMap()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SwitchListTile(
                      title: Text(isActive ? "Perfil actiu" : "Perfil inactiu"),
                      value: isActive,
                      activeTrackColor: Colors.teal,
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

                      // todo: Call al service de la api x la creacio del usuari
                      // Si retorna ok, el usuari s'haura creat, per tant:
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuari creat')),
                      );

                      ref.watch(userProvider.notifier).updateUser(UserModel(
                            id: 1,
                            name: _nameCtrl.text,
                            email: _emailCtrl.text,
                            password: _passwordCtrl.text,
                            invitation: _invitationCtrl.text,
                            location: "latlang",
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
