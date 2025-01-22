import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final imageurl;
  const CarouselCard({super.key, this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: const Color.fromARGB(255, 111, 110, 110),
      elevation: 10.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          imageurl,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width*0.9,
        ),
      ),
    );
  }
}
