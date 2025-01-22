import 'package:bloc/bloc.dart';
import '../../../data/api/product_api.dart';
import '../../../data/model/productmodel.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductController _productController;

  ProductBloc(this._productController)
      : super(ProductState(imageList: [], wishList: [])) {
    on<FetchProductsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true)); 

      try {
        final List<Product> products = await _productController.fetchProducts();

        final List<Map<String, dynamic>> imageList = products.map((product) {
          return {
            "name": product.name,
            "price": "₹${product.salePrice.toStringAsFixed(2)}",
            "rating": product.avgRating.toString(),
            "image": product.featuredImage.isNotEmpty
                ? product.featuredImage
                : 'assets/images/placeholder.png',
          };
        }).toList();

        final wishList = List<bool>.filled(products.length, false);

        emit(state.copyWith(imageList: imageList, wishList: wishList, isLoading: false));
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
