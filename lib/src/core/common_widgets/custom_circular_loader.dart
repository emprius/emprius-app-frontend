import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularLoader extends StatelessWidget {
  Color? color;
  final double size;
  final double lineWidth;

  CustomCircularLoader({
    super.key,
    this.color,
    this.size = 30,
    this.lineWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    color ??= Theme.of(context).colorScheme.primary; // todo(kon) use color palete

    return Center(
      child: SpinKitRing(
        color: color!,
        size: size,
        lineWidth: lineWidth,
        duration: Durations.slower,
      ),
    );
  }
}
