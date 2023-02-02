

import 'package:empriusapp/src/core/helper/utils/constants.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('empty name returns error string',(){
    var result = FormValidator.nameValidator('');
    expect(result, Constants.invalidNameError);
  });

  test('non-empty name returns null',(){
    var result = FormValidator.nameValidator('name');
    expect(result, null);
  });

  test('empty password returns error string',(){
    var result = FormValidator.passwordValidator('');
    expect(result, Constants.emptyPasswordInputError);
  });

  test('non-empty password returns null',(){
    var result = FormValidator.passwordValidator('1234');
    expect(result, null);
  });

  test('empty e-mail returns error string',(){
    var result = FormValidator.emailValidator('');
    expect(result, Constants.emptyEmailInputError);
  });

  test('non-empty e-mail returns null',(){
    var result = FormValidator.emailValidator('');
    expect(result, null);
  });

}