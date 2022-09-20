import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  //final String text;
  final IconData icon;
  final Color color;
  final double width;

  const StatusLabel({
    Key? key,
    //required this.text,
    required this.icon,
    required this.color,
    this.width = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: CircleBorder(),       ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Text(text),
          //SizedBox(width: width),
          Icon(icon, size: 20.0),
        ],
      ),
    );
  }
}
