import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';


class ToolCaroussel extends ConsumerStatefulWidget {
  final List<String> images;
  const ToolCaroussel(this.images, {Key? key}) : super(key: key);

  @override
  createState() => _ToolCarousselState();
}

class _ToolCarousselState extends ConsumerState<ToolCaroussel> {


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 200.0,
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
      : FileImage(File(imgPath));

  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
          fit: BoxFit.fill,
            image: (toolImage as ImageProvider)
        )
      )
      );
}
