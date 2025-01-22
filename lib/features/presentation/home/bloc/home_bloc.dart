import 'package:bloc/bloc.dart';
import 'package:product_list/features/presentation/home/bloc/home_event.dart';
import 'package:product_list/features/presentation/home/bloc/home_state.dart';
import '../../../data/api/carousil_api.dart';
import '../../../data/api/product_api.dart';
import '../../../data/model/bannermodel.dart';
import '../../../data/model/productmodel.dart';

class HomeBloc extends Bloc<HomeEvent, Homestate> {
  final ProductController _productController;
  final BannerController _bannerController;
  HomeBloc(this._productController, this._bannerController)
      : super(Homestate(
          imageList: [],
          wishList: [],
          bannerList: [],
        )) {
    on<FetchHomeEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        final List<Product> products = await _productController.fetchProducts();

        List<Map<String, dynamic>> mapToImageList(List<dynamic> items) {
          return items.map((item) {
            return {
              "name": item.name,
              "price": "₹${item.salePrice.toStringAsFixed(2)}",
              "rating": item.avgRating.toString(),
              "image": item.featuredImage.isNotEmpty
                  ? item.featuredImage
                  : 'assets/images/placeholder.png',
            };
          }).toList();
        }

//  final List<Banner> banner = await _bannerController.fetchbanner();

        final product = await _productController.fetchProducts();
        final banners = await _bannerController.fetchbanner();

        final imageList = mapToImageList(product);
        // final bannerList = mapToImageList(banners);
        final List<bool> wishList = List<bool>.filled(products.length, false);

        emit(state.copyWith(
          bannerList: banners,
          imageList: imageList,
          wishList: wishList,
          isLoading: false,
        ));
      } catch (error) {
        emit(state.copyWith(error: error.toString(), isLoading: false));
      }
    });

    on<ToggleWishlistEvent>((event, emit) {
      final updatedWishList = List<bool>.from(state.wishList);
      updatedWishList[event.index] = !updatedWishList[event.index];
      emit(state.copyWith(wishList: updatedWishList));
    });
  }
}
