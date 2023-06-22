import 'package:empriusapp/src/core/common_widgets/custom_circular_loader.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  /// Shows the circular progres indicator if loading

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onClicked,
    this.color,
    this.borderRadius = 8,
    this.padding  = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      onPressed: onClicked,
      child: Text(text),
    );
  }
}