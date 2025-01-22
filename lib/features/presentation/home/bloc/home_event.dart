abstract class HomeEvent {}

class FetchHomeEvent extends HomeEvent {}

class ToggleWishlistEvent extends HomeEvent {
  final int index;

  ToggleWishlistEvent(this.index);
}
