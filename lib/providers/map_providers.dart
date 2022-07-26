import 'package:empriusapp/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final userMapProvider = StateNotifierProvider<LatLngNotifier, List<LatLng>>(
        (ref) => LatLngNotifier());

// The public methods on this class will be what allow the UI to modify the state.
class LatLngNotifier extends StateNotifier<List<LatLng>> {
  LatLngNotifier() : super([]);

  void update(List<LatLng> locations) {
    state = locations;
  }
}