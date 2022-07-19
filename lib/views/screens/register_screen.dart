//import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final registerFormKey = GlobalKey<FormState>();
  late bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: registerFormKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nom d'usuari",
                          ),
                          validator: (value) {
                            if (value?.length == 0) {
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
                    //controller: emailControler,
                    decoration:
                        const InputDecoration(labelText: "Correu electronic"),
                    validator: (value) {
                      if (value?.length == 0) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Mot de pas"),
                    validator: (value) {
                      if (value?.length == 0) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Repetir mot de pas"),
                    validator: (value) {
                      if (value?.length == 0) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Introdueix clau d'invitacio"),
                    validator: (value) {
                      if (value?.length == 0) {
                        return "Aquest camp es requerit";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Localitza't al mapa:"),
                  const SizedBox(
                    height: 250,
                      child: UserMap()),
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
                      child: Text('Finalitza registre'),
                      onPressed: () {
                        // form validation
                        // Instancies un user
                        //var user = UserModel(id: id, email: emailControle.value, password: password, invitation: invitation, location: location)

                        // todo(aruru): implement service call
                        // service.signup(user).then(() {
                        // todo: implement provider
                        // Si es ok, guardes el user al provider i fas:
                        Navigator.pushReplacementNamed(context, homeScreenRoute);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
