import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/auth_user/domain/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  var _emailCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
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
                    // height: 40,
                    child: CustomTextButton(
                      text: "Entra a l'app!",
                      onClicked: () {
                        if (!_formKey.currentState!.validate()) return;
                        // Todo(kon): after implement jwt this will be different, because we will need
                        // to check if the token is invalid or expired. Now, authenticated, mean that user
                        // credentials are retrieved from the storage so it can safely login without bugs
                        else if (ref.read(userProvider.notifier).authState is! AUTHENTICATED) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Usuari o contrassenya incorrectes')),
                          );
                          return;
                        }
                        Navigator.pushReplacementNamed(context, userProfileScreenRoute);
                      }
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, registerScreenRoute);
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "¿No estas registrada? ",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                          children: [
                            TextSpan(
                                text: "Registra't",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
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
