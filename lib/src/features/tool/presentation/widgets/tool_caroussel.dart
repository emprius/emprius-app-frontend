import 'package:carousel_slider/carousel_slider.dart';
import 'package:empriusapp/src/core/helper/utils/asset_or_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';


class ToolCarousel extends ConsumerStatefulWidget {
  final List<String> images;
  const ToolCarousel(this.images, {Key? key}) : super(key: key);

  @override
  createState() => _ToolCarouselState();
}

class _ToolCarouselState extends ConsumerState<ToolCarousel> {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        height: 180.0,
        enlargeCenterPage: true,
      ),
      itemCount: widget.images.length,
      itemBuilder: (context, index, realIndex) {
        // final toolImage = widget.images[index].contains('https://')
        //     ? NetworkImage(widget.images[index])
        //     : FileImage(File(widget.images[index]));
        return buildImage(widget.images[index], index);

      },
    );
  }

}

Widget buildImage(String imgPath, int index) {
  final toolImage = imgPath.contains('https://')
      ? NetworkImage(imgPath)
      : assetOrFileImage(imgPath);
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      //width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black26,
        image: DecorationImage(
          fit: BoxFit.cover,
            image: toolImage
          )
        )
      );
}
