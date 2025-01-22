class WishlistItem {
  final int id;
  final String name;
  final String description;
  final String caption;
  final String featuredImage;
  final List<String> images;
  final bool inWishlist;
  final bool variationExists;
  final bool available;
  final String availableFrom;
  final String availableTo;
  final int salePrice;
  final int mrp;
  final double discount;
  final int avgRating;
  final String productType;
  final List<Variation> variations;
  final List<Addon> addons;

  WishlistItem({
    required this.id,
    required this.name,
    required this.description,
    required this.caption,
    required this.featuredImage,
    required this.images,
    required this.inWishlist,
    required this.variationExists,
    required this.available,
    required this.availableFrom,
    required this.availableTo,
    required this.salePrice,
    required this.mrp,
    required this.discount,
    required this.avgRating,
    required this.productType,
    required this.variations,
    required this.addons,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      caption: json['caption'],
      featuredImage: json['featured_image'],
      images: List<String>.from(json['images']),
      inWishlist: json['in_wishlist'],
      variationExists: json['variation_exists'],
      available: json['available'],
      availableFrom: json['available_from'],
      availableTo: json['available_to'],
      salePrice: json['sale_price'],
      mrp: json['mrp'],
      discount: double.parse(json['discount']),
      avgRating: json['avg_rating'],
      productType: json['product_type'],
      variations: json['variations'] != null
          ? List<Variation>.from(
              json['variations'].map((x) => Variation.fromJson(x)))
          : [],
      addons: json['addons'] != null
          ? List<Addon>.from(json['addons'].map((x) => Addon.fromJson(x)))
          : [],
    );
  }
}

class Variation {
  final int id;
  final int salePrice;
  final String variationName;
  final String featuredImage;
  final int stock;

  Variation({
    required this.id,
    required this.salePrice,
    required this.variationName,
    required this.featuredImage,
    required this.stock,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      id: json['id'],
      salePrice: json['sale_price'],
      variationName: json['variation_name'],
      featuredImage: json['featured_image'],
      stock: json['stock'],
    );
  }
}

class Addon {
  final int id;
  final int price;
  final String name;
  final String description;
  final String featuredImage;
  final int stock;

  Addon({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.featuredImage,
    required this.stock,
  });

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      id: json['id'],
      price: json['price'],
      name: json['name'],
      description: json['description'],
      featuredImage: json['featured_image'],
      stock: json['stock'],
    );
  }
}
