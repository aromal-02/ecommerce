class Homestate {
  final List<Map<String, dynamic>> imageList;
  final List<String> bannerList;
  final List<bool> wishList;
  final bool isLoading;
  final String? error;

  Homestate({
    required this.imageList,
    required this.bannerList,
    required this.wishList,
    this.isLoading = false,
    this.error,
  });

  Homestate copyWith({
    List<Map<String, dynamic>>? imageList,
    List<String>? bannerList,
    List<bool>? wishList,
    bool? isLoading,
    String? error,
  }) {
    return Homestate(
      imageList: imageList ?? this.imageList,
      bannerList: bannerList ?? this.bannerList,
      wishList: wishList ?? this.wishList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
