import 'package:flutter/material.dart';

class UserMarkerCopy extends StatefulWidget {
  final Widget child;
  final String tooltip;
  final Function onTap;

  UserMarkerCopy({required this.child, required this.tooltip, required this.onTap});

  @override
  State<UserMarkerCopy> createState() => _UserMarkerCopyState();
}

class _UserMarkerCopyState extends State<UserMarkerCopy> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        final dynamic tooltip = key.currentState;
        tooltip.ensureToolTipVisible();
        widget.onTap();
      },
      child: Tooltip(
        key: key,
        message: widget.tooltip,
        child: widget.child,
      ),
    );
  }
}
