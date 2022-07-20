import 'package:empriusapp/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Benvinguda a Emprius app'),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        hintText: "E-mail",
                      ),
                      validator: (value) {
                        String pattern =
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                        RegExp regExp = RegExp(pattern);
                        if (value == null || value.isEmpty) {
                          return "Introdueix e-mail!";
                        } else if (value.length < 8 ||
                            !regExp.hasMatch(value.toString())) {
                          return "E-mail incorrecte!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _passwordCtrl,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: "Mot de pas",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Introdueix mot de pas";
                        }
                        return null;
                      },
                    )),
                SizedBox(
                    height: 40,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                          }
                          Navigator.pushNamed(context, homeScreenRoute);
                        },
                        child: const Text("Entra a l'app!"))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "¿No estas registrada? ",
                        style: const TextStyle(
                          color: Colors.black26,
                        ),
                        children: [
                          TextSpan(
                              text: "Registra't",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, registerScreenRoute);
                                }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
