import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomProduct extends StatelessWidget {
  final String imageurl;
  final onpress;
  final bool image;
  final String name;
  final String rating;

  final String prize;

  const CustomProduct(
      {super.key,
      required this.imageurl,
      this.onpress,
      required this.image,
      required this.name,
      required this.rating,
      required this.prize});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colour.pWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Image.network(
              imageurl,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: IconButton(
              onPressed: onpress,
              icon: image
                  ? Icon(
                      Icons.favorite,
                      color: Colour.pred,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: const Color.fromARGB(255, 92, 90, 90),
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colour.pWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 14),
                            SizedBox(width: 4),
                            Text(
                              rating,
                              style:
                                  TextStyle(color: Colour.pWhite, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Text(
                      prize,
                      style: TextStyle(
                        color: Colour.pWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
