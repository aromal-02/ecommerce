class Bannermodel {
  final int id;
  // final Banner product;
  final String name;
  final String image;
  // final int showingOrder;
  // final bool isActive;

  Bannermodel({
    required this.id,
    // required this.product,
    required this.name,
    required this.image,
    // required this.showingOrder,
    // required this.isActive,
  });

  factory Bannermodel.fromJson(Map<String, dynamic> json) {
    return Bannermodel(
      id: json['id'],
      // product: Banner.fromJson(json['product']),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      // showingOrder: json['showing_order'],
      // isActive: json['is_active'] ?? false,
    );
  }
}

class Banner {
  final int id;
  // final List<dynamic> variations;
  // final bool inWishlist;
  // final double avgRating;
  final List<String> images;
  // final bool variationExists;
  // final double salePrice;
  // final List<Addon> addons;
  // final bool available;
  // final String availableFrom;
  // final String availableTo;
  // final String name;
  // final String description;
  // final String caption;
  // final String featuredImage;
  // final double mrp;
  // final int stock;
  // final bool isActive;
  // final String discount;
  // final String createdDate;
  // final String productType;
  // final int? showingOrder;
  // final String variationName;
  // final int category;
  // final double taxRate;

  Banner({
    required this.id,
    // required this.variations,
    // required this.inWishlist,
    // required this.avgRating,
    required this.images,
    // required this.variationExists,
    // required this.salePrice,
    // required this.addons,
    // required this.available,
    // required this.availableFrom,
    // required this.availableTo,
    // required this.name,
    // required this.description,
    // required this.caption,
    // required this.featuredImage,
    // required this.mrp,
    // required this.stock,
    // required this.isActive,
    // required this.discount,
    // required this.createdDate,
    // required this.productType,
    // this.showingOrder,
    // required this.variationName,
    // required this.category,
    // required this.taxRate,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      // variations: json['variations'] ?? [],
      // inWishlist: json['in_wishlist'] ?? false,
      // avgRating: json['avg_rating'] ?? 0,
      images: [],
      // variationExists: json['variation_exists'] ?? false,
      // salePrice: 170,
      // addons: (json['addons'] as List).map((e) => Addon.fromJson(e)).toList(),
      // available: json['available'] ?? false,
      // availableFrom: json['available_from'],
      // availableTo: json['available_to'],
      // name: json['name'],
      // description: json['description'],
      // caption: json['caption'],
      // featuredImage: json['featured_image'],
      // mrp: json['mrp'] ?? 0,
      // stock: json['stock'],
      // isActive: json['is_active'] ?? false,
      // discount: json['discount'],
      // createdDate: json['created_date'],
      // productType: json['product_type'],
      // showingOrder: json['showing_order'],
      // variationName: json['variation_name'] ?? false,
      // category: json['category'],
      // taxRate: json['tax_rate'] ?? 0,
    );
  }
}
