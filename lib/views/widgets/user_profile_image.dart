import 'package:flutter/material.dart';
import 'dart:io';

class ProfileImage extends StatelessWidget {
  final String avatar;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileImage({
    Key? key,
    required this.avatar,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = avatar.contains('https://')
    ? NetworkImage(avatar)
        : FileImage(File(avatar));

    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.transparent,
      child: Ink.image(
        image: image as ImageProvider,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
        child: InkWell(onTap: onClicked),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}