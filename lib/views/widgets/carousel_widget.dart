import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  //const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final toolImagesUrl = [
    "https://static.remove.bg/remove-bg-web/5c20d2ecc9ddb1b6c85540a333ec65e2c616dbbd/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png",
    'https://images.unsplash.com/photo-1581166397057-235af2b3c6dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1501516069922-a9982bd6f3bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1519003722824-194d4455a60c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1175&q=80',
    'https://images.unsplash.com/photo-1587582423116-ec07293f0395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 200.0,
        enlargeCenterPage: true,
      ),
      itemCount: toolImagesUrl.length,
      itemBuilder: (context, index, realIndex) {
        final toolImage = toolImagesUrl[index];
        return buildImage(toolImage, index);
      },
    );
  }

  Widget buildImage(String toolImage, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    color: Colors.black26,
    width: double.infinity,
    child: Image.network(
      toolImage,
      fit:BoxFit.cover,
    ),
  );
}

