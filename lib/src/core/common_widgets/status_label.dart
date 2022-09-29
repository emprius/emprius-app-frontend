import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  final String? text;
  final IconData icon ;
  final Color color;

  const StatusLabel({
    Key? key,
    this.text,
    this.icon = Icons.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 20.0, color: color);
  }
}
