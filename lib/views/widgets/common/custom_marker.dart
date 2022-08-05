import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  final Icon icon;
  UserMarker(this.icon,);


  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.pin_drop_rounded, color: Colors.orangeAccent, size: 60,);
  }
}
