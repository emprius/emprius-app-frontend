import 'package:empriusapp/routes/routes.dart';
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: registerFormKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Nom d'usuari"),
                        validator: (value) {
                          if (value?.length == 0) {
                            return "Aquest camp es requerit";
                          }
                          return null;
                        },
                      ),
                    ),
                    Icon(Icons.person_add_alt_1_rounded),
                  ],
                ),
                TextFormField(
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
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Localitza't al mapa"),
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
                      Navigator.pushNamed(context, homeScreenRoute);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
