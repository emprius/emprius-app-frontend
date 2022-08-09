import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/form_validator.dart';
import 'package:empriusapp/views/widgets/common/custom_text_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/common/custom_textfield.dart';

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
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

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
                    child: CustomTextField(
                      controller: _emailCtrl,
                      validator: FormValidator.emailValidator,
                      labelText: "E-mail",
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
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
                ),
                SizedBox(
                    height: 40,
                    child: CustomTextButton(
                      text: "Entra a l'app!",
                      onClicked: () {
                        if (!_formKey.currentState!.validate()) return;
                        Navigator.pushReplacementNamed(context, homeScreenRoute);
                      },
                    ),
                ),
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
