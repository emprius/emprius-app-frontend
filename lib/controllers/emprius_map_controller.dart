import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


/// Controller for [EmpriusMap] widget
class EmpriusMapController {

  /// Selected location on the map onTap.
  ///
  /// Disabled if empriusMap [isViewOnly] is true.
  LatLng? selectedLocation;

  /// List of Markers to paint or already painted on the map
  List<Marker>? markers;

  /// Function that basically run setState on the widget
  Function()? refresh;

  /// Controller used to control the inner flutter_map widget.
  ///
  /// It has functions like, move, rotate, zoom, etc..
  MapController? flutterMapController;

  /// Function to run when [validate] function is called.
  ///
  /// Should return null if no error or a error message string
  /// if error.
  ///
  /// It pass selected position when onTap
  String? Function(LatLng? value)? validator;

  /// Error mesage to show when validate function fails
  String? _errorMsg;

  get errorMsg => _errorMsg;

  EmpriusMapController({
    this.selectedLocation,
    this.validator,
    this.markers
  });

  /// Run the validator and return true if validator is not null
  bool validate() {
    if(validator != null) {
      var res = validator!(selectedLocation);
      _errorMsg = res;
      if (refresh != null) refresh!();
      if (res == null) {
        return true;
      }
      return false;
    } else {
      return true;
    }
  }
}


