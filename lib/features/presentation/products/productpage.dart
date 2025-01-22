import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/colors.dart';
import '../../../core/widget/customappbar.dart';
import '../../../core/widget/customproductcard.dart';
import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'bloc/product_state.dart';

class ProductPage extends StatelessWidget {
  final ProductBloc productBloc;

  ProductPage(this.productBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.pBackgroundBlack,
      appBar: CustomAppbar(
        title: "Products",
        visible: false,
      ),
      body: BlocProvider(
        create: (_) => productBloc..add(FetchProductsEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state!.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state.imageList.isEmpty) {
              return Center(child: Text('No products available.'));
            }

            return ListView.builder(
              itemCount: state.imageList.length,
              itemBuilder: (context, index) {
                final product = state.imageList[index];
                return CustomProduct(
                  imageurl: product['image'],
                  onpress: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(ToggleWishlistEvent(index));
                  },
                  image: state.wishList[index],
                  name: product['name'],
                  rating: product['rating'],
                  prize: product['price'],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
