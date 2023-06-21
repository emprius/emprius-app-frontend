import 'package:latlong2/latlong.dart';

var defaultMapCenter = LatLng(41.695384, 2.492793);
var defaultAvatar = "assets/avatars/fallback.png";
var fallbackImage = "assets/avatars/fallback.png";

class Constants{
  const Constants._();

  /// The error message for invalid name input.
  static const invalidNameError = "Aquest camp es requerit";

  /// Short value password
  static const shortError = "Camp minim de {n}";

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

  /// The error message for invalid invitation input.
  static const emptyInvitationError = "AQUEST CAMP ES REQUERIT";

  /// The error message for invalid invitation input.
  static const emptyLocationError = "Introdueix una localitzacio";

  /// A utility method to convert any instance to null
  static T? toNull<T>(Object? _) => null;

  /// A utility method to remove nulls from int list
  static List<int>? removeNulls(List? list) {
    return list?.whereType<int>().toList();
  }

  /// A utility method to convert 0/1 to false/true
  static bool boolFromInt(int i) => i == 1;

}