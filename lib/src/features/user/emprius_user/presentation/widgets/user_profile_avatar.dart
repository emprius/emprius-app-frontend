import 'package:empriusapp/src/core/helper/constants/asset_or_file_image.dart';
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/theme/theme_controller.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUserAvatar extends ConsumerWidget {
  final bool showBadge;
  const CurrentUserAvatar({
    Key? key,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider)!;
    return UserProfileAvatar(
      avatar: user.avatar?.isEmpty ?? true ? defaultAvatar : user.avatar!,
      showBadge: showBadge,
    );
  }
}


class UserProfileAvatar extends StatelessWidget {
  final String avatar;
  final bool showBadge;
  Color? outerCircleColor;
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
    //final theme = ref.watch(themeProvider.notifier);
    innerCircleColor = Theme.of(context).colorScheme.primary;
    outerCircleColor = Theme.of(context).colorScheme.primary;

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
    final image = avatar.contains(RegExp(r"^(http|https)"))
        ? NetworkImage(avatar) // todo(kon): use CachedNetworkImage package (check UniPal repo on how they do it)
        : assetOrFileImage(avatar);

    return CircleAvatar(
      radius: 42,
      backgroundColor: outerCircleColor,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: image as ImageProvider,
      ),
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