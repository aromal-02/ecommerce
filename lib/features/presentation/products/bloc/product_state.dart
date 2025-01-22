class ProductState {
  final List<Map<String, dynamic>> imageList;
  final List<bool> wishList;
  final bool isLoading;
  final String? error;

  ProductState({
    required this.imageList,
    required this.wishList,
    this.isLoading = false,
    this.error,
  });

  ProductState copyWith({
    List<Map<String, dynamic>>? imageList,
    List<bool>? wishList,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      imageList: imageList ?? this.imageList,
      wishList: wishList ?? this.wishList,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
