import 'package:flutter/material.dart';
import 'constants.dart';

class FormValidator{
  const FormValidator._();

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.invalidNameError;
    }
    return null;
  }

  static String? emailValidator(String? value){
    if(value == null || value.isEmpty)  {
      return Constants.emptyEmailInputError;
    } else if (!Constants.emailRegex.hasMatch(value)) {
      return Constants.invalidEmailError;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.emptyPasswordInputError;
    } else if (value.length < 8) {
      return Constants.shortPasswordInputError;
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String inputPw) {
    if (value == null || value.isEmpty) {
      return Constants.emptyPasswordInputError;
    } else if (value == inputPw.trim()) {
      return null;
    }
      return Constants.invalidConfirmPwError;
  }

  static String? invitationValidator(String? value) {
    if (value != null) return null;
    return Constants.emptyInvitationError;
  }

}