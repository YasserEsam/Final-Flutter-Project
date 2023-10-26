import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselSliderWidget extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  CarouselSliderWidget({super.key, required this.size, required this.autoplay});

  double size;
  bool autoplay;
 
  List<String> urls = [
    'assets/images/1.jpg',
    'assets/images/three.jpg',
    'assets/images/one.jpg',
    'assets/images/aa.jpg',
  ];

  List<Widget> stringsToWidgets(List<String>? urls) {
    List<Widget> images = [];
    for (var item in urls!) {
      images.add(Image.asset(
        item,
        fit: BoxFit.fill,
      ));
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: size,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            items: stringsToWidgets(urls),
            options: CarouselOptions(
              autoPlay: autoplay,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
        ],
      ),
    );
  }
}
