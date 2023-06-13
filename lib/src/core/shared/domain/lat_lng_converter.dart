import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:latlong2/latlong.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngConverter implements JsonConverter<LatLng, JSON> {
  const LatLngConverter();

  final e = 1000000;

  @override
  LatLng fromJson(JSON latLng) {
    return LatLng(((latLng["latitude"] as int) / e).toDouble(), ((latLng["latitude"] as int) / e).toDouble());
  }

  @override
  JSON toJson(LatLng latLng) =>  {
    "latitude": (latLng.latitude * e).toInt(),
    "longitude": (latLng.longitude * e).toInt()
  };
}
