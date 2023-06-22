import 'package:empriusapp/src/core/common_widgets/custom_circular_loader.dart';
import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/core/helper/form_validator.dart';
import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    void onData(bool? isAuthenticated) {
      if (isAuthenticated != null && isAuthenticated) {
        // todo(kon): use better navigation: use pop until and let the widgets move you until profile screen
        Navigator.pushReplacementNamed(context, userProfileScreenRoute);
        // erpController.clear();
        // passwordController.clear();
        // AppRouter.popUntilRoot();
      }
    }

    ref.listen<FutureState<bool?>>(
      authProvider,
      (_, authState) => authState.whenOrNull(
          data: onData,
          failed: (reason) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Usuari o contrassenya incorrectes')),
              )),
    );

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
                  child: CustomTextButton(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final authState = ref.watch(authProvider);
                        return authState.maybeWhen(
                          loading: () => CustomCircularLoader(),
                          orElse: () => child!,
                        );
                      },
                      text: "Entra a l'app!",
                      onClicked: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(authProvider.notifier).login(
                              password: _passwordCtrl.text,
                              email: _emailCtrl.text);
                        }
                        // else if (ref.read(currentUserProvider.notifier).authState is !AUTHENTICATED) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Usuari o contrassenya incorrectes')),
                        //   );
                        //   return;
                        // }
                        // Navigator.pushReplacementNamed(context, userProfileScreenRoute);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, registerScreenRoute);
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
