import 'package:flutter/material.dart';
import 'constants.dart';

class FormValidators{
  const FormValidators._();

  static emailValidator(String value){

    if(value == null || value.isEmpty) {
      return Constants.emptyEmailInputError;
    } else if (!emailRegex.hasMatch(value)) {
      return Constants.invalidEmailError;
    }
    return null;
  }

}