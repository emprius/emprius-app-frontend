import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  final Icon icon;
  UserMarker(this.icon,);


  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.location_on_sharp, color: Colors.purple, size: 45.0 );
  }
}
