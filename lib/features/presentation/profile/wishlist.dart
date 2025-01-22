import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widget/customappbar.dart';

class WishList extends StatelessWidget {
  WishList({super.key});
  List<String> imageList = [
    'assets/images/images.jpeg',
    'assets/images/images (1).jpeg',
    'assets/images/images (2).jpeg',
    'assets/images/images (3).jpeg',
    'assets/images/images (4).jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.pBackgroundBlack,
      appBar: CustomAppbar(
        title: "Wishlist",
        visible: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colour.pWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
              Positioned(
                  right: 10,
                  top: 5,
                  child: Icon(
                    Icons.favorite,
                    color: Colour.pred,
                  ))
            ]),
          );
        },
      ),
    );
  }
}
