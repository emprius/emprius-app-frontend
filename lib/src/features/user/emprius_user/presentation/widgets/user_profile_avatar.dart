import 'package:flutter/material.dart';
import 'dart:io';

class UserProfileAvatar extends StatelessWidget {
  final String avatar;
  final bool showBadge;

  Color? innerCircleColor;

  final  IconData badgeIcon;

  UserProfileAvatar({
    Key? key,
    required this.avatar,
    this.showBadge = false,
    this.badgeIcon = Icons.edit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    innerCircleColor = Theme.of(context).colorScheme.primary;

    return Stack(
      fit: StackFit.expand,
      children: [
        buildImage(),
        if(showBadge)
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(),
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = avatar.contains('https://')
    ? NetworkImage(avatar)
        : FileImage(File(avatar));

    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.transparent,
      backgroundImage: image as ImageProvider,
    );
  }

  Widget buildEditIcon() => buildCircle( // External circle
    all: 3,
   color: Colors.white,
    child: buildCircle( // Internal circle
      color: innerCircleColor,
      all: 8,
      child: Icon(
        badgeIcon,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required color ,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          padding: EdgeInsets.all(all),
          child: child,
        ),
      );
}