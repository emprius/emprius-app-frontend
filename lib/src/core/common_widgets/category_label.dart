import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final double width;

  const CategoryLabel({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    this.width = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          SizedBox(width: width),
          Icon(icon, size: 24.0),
        ],
      ),
    );
  }
}
