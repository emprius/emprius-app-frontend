import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:empriusapp/src/core/common_widgets/async_value_widget.dart';
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/features/images/models/emprius_image.dart';
import 'package:empriusapp/src/features/images/providers/emprius_image_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmpriusImage extends ConsumerWidget {
  final String hash;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Widget Function(EmpriusImageModel)? imageBuilder;

  const EmpriusImage({
    Key? key,
    required this.hash,
    this.placeholder,
    this.errorWidget,
    this.imageBuilder,
  }) : super(key: key);

  Widget _defaultImageWidget (EmpriusImageModel image) =>
      Image.memory(base64Decode(image.content));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<EmpriusImageModel>(
      value: ref.watch(empriusImageFutureProvider(hash)),
      loading: ( ) => placeholder ?? const SizedBox.shrink(),
      error: (error, st) => errorWidget ??  const SizedBox.shrink(),
      data: imageBuilder ?? _defaultImageWidget
    );
  }

  // kon: this example below is how it looks like if the image data is served directly
  // However, the server return a json with a base64 blob, so it have to be accessed using a
  // normal http call using dio service.
  // I let this here if is needed on the future...
  //
  // final ImageWidgetBuilder? imageBuilder;
  //
  // Widget defaultImageWidget (ImageProvider imageProvider) => Container(
  //   decoration: BoxDecoration(
  //     image: DecorationImage(
  //         image: imageProvider ),
  //   ),
  // );
  //
  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final token = ref.watch(keyValueStorageServiceProvider).getAuthToken();
  //   final url = ApiEndpoint.baseUrl + ApiEndpoint.images(ImagesEndpoint.GET, hash: hash);
  //   return FutureBuilder<String>(
  //     future: token,
  //     builder: (ctx, snapshot) {
  //       if (snapshot.hasData) {
  //         return CachedNetworkImage(
  //             imageUrl: url,
  //             placeholder: (context, url) => placeholder ?? const SizedBox.shrink(),
  //             errorWidget: (context, url, error) => errorWidget ??  const SizedBox.shrink(),
  //             imageBuilder: imageBuilder ??
  //                     (context, imageProvider) => defaultImageWidget(imageProvider),
  //             httpHeaders: {
  //               "Authorization": "BEARER ${snapshot.data}",
  //             }
  //         );
  //       }
  //       return tokenLoadingWidget ?? defaultImageWidget(AssetImage(fallbackImage));
  //     },
  //   );
  // }
}

