import 'package:latlong2/latlong.dart';

class MapValidator{
  /// Function to run when [validate] function is called.
  ///
  /// Should return null if no error or a error message string
  /// if error.
  ///
  /// It pass selected position when onTap
  String? Function(LatLng? value) validator;

  /// Function that basically run setState on the widget
  Function()? refresh;

  /// Selected location on the map onTap.
  ///
  /// Disabled if empriusMap [isViewOnly] is true.
  LatLng? selectedLocation;

  /// Error mesage to show when validate function fails
  String? _errorMsg;
  get errorMsg => _errorMsg;


  MapValidator({required this.validator});

  /// Run the validator and return true if validator is not null
  bool validate() {
    var res = validator(selectedLocation);
      _errorMsg = res;
      if (refresh != null) refresh!();
      if (res == null) {
        return true;
      }
      return false;
  }

}