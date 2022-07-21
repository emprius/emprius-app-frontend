import 'package:flutter/material.dart';

class Constants{
  const Constants._();

  /// The error message for invalid name input.
  static const invalidNameError = "Siusplau introdueix nom d'usuari";

  /// The regular expression for validating emails.
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  /// The error message for empty email input.
  static const emptyEmailInputError = 'Introdueix e-mail';

  /// The error message for invalid email input.
  static const invalidEmailError = 'E-mail incorrecte';

  /// The error message for empty password input.
  static const emptyPasswordInputError = 'Introdueix mot de pas';

  /// The error message for invalid current password input.
  static const shortPasswordInputError = 'El mot de pas ha de tenir minim 8 caracters';

  /// The error message for invalid confirm password input.
  static const invalidConfirmPwError = "El mot de pas no coincideix";

  /// The error message for invalid name input.
  static const emptyInvitationError = "AQUEST CAMP ES REQUERIT";


}