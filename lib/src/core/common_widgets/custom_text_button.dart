import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onClicked,
    this.color,
    this.borderRadius = 6,
    this.padding  = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 12,),
        //minimumSize: Size.zero,
        //padding: EdgeInsets.zero,
        padding: padding,
        primary: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onClicked,
      child: Text(text),
    );
  }
}