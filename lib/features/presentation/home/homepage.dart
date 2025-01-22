import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presentation/home/bloc/home_bloc.dart';
import 'package:product_list/features/presentation/home/bloc/home_event.dart';
import 'package:product_list/features/presentation/home/bloc/home_state.dart';
import 'package:product_list/features/presentation/home/widget/carousil.dart';
import '../../../core/constant/colors.dart';
import '../../../core/widget/customappbar.dart';
import '../../../core/widget/customproductcard.dart';
import '../../../core/widget/customsearchbar.dart';

class HomePage extends StatelessWidget {
  final HomeBloc productBloc;

  HomePage(this.productBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.pBackgroundBlack,
      appBar: CustomAppbar(
        title: "Home",
        visible: false,
      ),
      body: BlocProvider(
        create: (_) => productBloc..add(FetchHomeEvent()),
        child: BlocBuilder<HomeBloc, Homestate>(
          builder: (context, state) {
            if (state!.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(
                  child: Text('Error: ${state.error ?? "Unknown error"}'));
            } else if (state.imageList.isEmpty) {
              return Center(child: Text('No products available.'));
            }

            return Column(
              spacing: 20,
              children: [
                SizedBox(),
                RouteSearchBar(),
                CarousilSlider(
                  imageList: state.bannerList,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: state.imageList.length,
                    itemBuilder: (context, index) {
                      final product = state.imageList[index];
                      return CustomProduct(
                        imageurl: product['image'],
                        onpress: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(ToggleWishlistEvent(index));
                        },
                        image: state.wishList[index],
                        name: product['name'],
                        rating: product['rating'],
                        prize: product['price'],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


//CarousilSlider
// RouteSearchBar(),