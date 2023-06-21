import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:empriusapp/src/features/images/widgets/EmpriusImage.dart';
import 'package:empriusapp/src/core/helper/constants/images_utils.dart';
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUserAvatar extends ConsumerWidget {
  final bool showBadge;
  const CurrentUserAvatar({
    Key? key,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarHash = ref.watch(currentUserProvider.select((value) => value?.avatarHash));
    return UserProfileAvatar(
      avatar: avatarHash ?? "",
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
            child: buildBadgeIcon(),
          ),
      ],
    );
  }

  Widget buildImage() {
    return avatar.isEmpty ? defaultAvatarImage()
        : isEmpriusImage(avatar)
        ? EmpriusImage(
          hash: avatar ,
          errorWidget: defaultAvatarImage(),
          placeholder: defaultAvatarImage(),
          imageBuilder: (image) => buildAvatarCircles(
            Image.memory(base64Decode(image.content)).image
        )
    )
        : buildAvatarCircles(assetOrFileImage(avatar));
  }

  Widget defaultAvatarImage() => buildAvatarCircles(assetOrFileImage(defaultAvatar));

  Widget buildAvatarCircles (ImageProvider image) => CircleAvatar(
    radius: 42,
    backgroundColor: outerCircleColor,
    child: CircleAvatar(
      radius: 40,
      backgroundImage: image,
    ),
  );

  Widget buildBadgeIcon() => buildBadgeCircle( // External circle
    all: 3,
    color: Colors.white,
    child: buildBadgeCircle( // Internal circle
      color: innerCircleColor,
      all: 8,
      child: Icon(
        badgeIcon,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildBadgeCircle({
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