import 'package:empriusapp/views/widgets/common/bottom_image_selector.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileImage extends StatelessWidget {
  final String avatar;
  final bool showBadge;

  const ProfileImage({
    Key? key,
    required this.avatar,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(
      fit: StackFit.expand,
      children: [
        buildImage(),
        if(showBadge != null) Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
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

  Widget buildEditIcon(color) => buildCircle(
    all: 3,
   color: Colors.white,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        showBadge ? Icons.edit : Icons.add_a_photo,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required color,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          padding: EdgeInsets.all(all),
          child: child,
        ),
      );
}