import 'package:flutter/material.dart';
import 'package:product_list/core/constant/colors.dart';
import 'package:product_list/features/data/api/wishlist_api.dart';
import '../../../core/widget/customappbar.dart';
import '../../../core/widget/customproductcard.dart';
import '../../data/model/wishmodel.dart';

class WishlistScreen extends StatelessWidget {
  final WishList wishListService = WishList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colour.pBackgroundBlack,
        appBar: CustomAppbar(
          title: "WishList",
          visible: true,
        ),
        body: FutureBuilder<List<WishlistItem>>(
          future: wishListService.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No items in wishlist.'),
              );
            }

            final wishlistItems = snapshot.data!;

            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];

                return CustomProduct(
                  imageurl: item.featuredImage,
                  onpress: () {},
                  name: item.name,
                  rating: "",
                  prize: '₹${item.salePrice}',
                  image: true,
                );
              },
            );
          },
        ));
  }
}
