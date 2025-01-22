import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product_list/features/presentation/home/widget/carousilcard.dart';

class CarousilSlider extends StatelessWidget {
  final List<String> imageList;  

  CarousilSlider({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return CarouselCard(imageurl: item);
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
