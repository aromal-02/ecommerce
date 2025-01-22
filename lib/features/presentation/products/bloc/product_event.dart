abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class ToggleWishlistEvent extends ProductEvent {
  final int index;

  ToggleWishlistEvent(this.index);
}
