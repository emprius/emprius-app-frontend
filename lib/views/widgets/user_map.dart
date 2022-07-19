import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class UserMap extends StatefulWidget {
  const UserMap({Key? key}) : super(key: key);

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.695384, 2.492793),
        zoom: 9.2,
        onLongPress: (tapPos, LatLng latLng) {
          markers = [];
          markers.add(
            Marker(
              point: latLng,
              builder: (ctx) => const Icon(Icons.location_pin),
            ),
          );
        }
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
    );
  }
}
