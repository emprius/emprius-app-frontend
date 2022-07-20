import 'package:flutter/material.dart';

class Constants{
  const Constants._();

  /// The error message for invalid email input.
  static const invalidEmailError = 'E-mail incorrecte';

  /// The error message for empty email input.
  static const emptyEmailInputError = 'Introdueix e-mail';

  /// The regular expression for validating emails in the app.
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  /// The error message for empty password input.
  static const emptyPasswordInputError = 'Introdueix mot de pas';

  /// The error message for invalid confirm password input.
  static const invalidConfirmPwError = "El mot de pas no coincideix";

  /// The error message for invalid current password input.
  static const invalidCurrentPwError = 'El mot de pas es incorrecte';

  /// The error message for invalid current password input.
  static const shortCurrentPwError = 'El mot de pas ha de tenir minim 8 caracters';




}