import 'package:latlong2/latlong.dart';
import 'constants/constants.dart';

class FormValidator{

  static String? nameValidator(String? value) {
    const minLength = 3;
    if (value == null || value.isEmpty) {
      return Constants.invalidNameError;
    }
    else if (value.length < minLength) {
      return Constants.shortError.replaceAll("{n}", minLength.toString());
    }
    return null;
  }

  static String? emailValidator(String? value){
    if(value == null || value.isEmpty)  {
      return Constants.emptyEmailInputError;
    }
    else if (!Constants.emailRegex.hasMatch(value)) {
      return Constants.invalidEmailError;
    }
    return null;
  }

  static String? emptyPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.emptyPasswordInputError;
    }
    return null;
  }

  static String? optionalPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else {
      if (value.length < 8) {
        return Constants.shortPasswordInputError;
      }
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.emptyPasswordInputError;
    } else if (value.length < 4) {
      return Constants.shortPasswordInputError;
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String inputPw) {
    if (value == inputPw.trim()) {
      return null;
    }
    return Constants.invalidConfirmPwError;
  }

  static String? invitationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.emptyInvitationError;
    }
    return null;
  }

  static String? locationNullValidator(LatLng? value) {
    if (value != null) return null;
    return Constants.emptyLocationError;
  }

}