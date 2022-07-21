import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/form_validator.dart';
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
  bool _isHidden = true;

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
                      validator: FormValidator.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        hintText: "E-mail",
                      ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _passwordCtrl,
                      validator: FormValidator.passwordValidator,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
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
                          if (!_formKey.currentState!.validate()) return;
                          Navigator.pushReplacementNamed(context, homeScreenRoute);
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
