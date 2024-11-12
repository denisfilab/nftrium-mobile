// lib/models/product.dart

class Product {
  final String id;
  final String productName;
  final String price;
  final List<String> imageUrls;
  final String category;
  final String categoryDisplay;
  final bool isInWishlist;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.categoryDisplay,
    required this.isInWishlist,
  });

  // Factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      productName: json['product_name'] as String,
      price: json['price'] as String,
      imageUrls: List<String>.from(json['image_urls']),
      category: json['category'] as String,
      categoryDisplay: json['category_display'] as String,
      isInWishlist: json['is_in_wishlist'] as bool,
    );
  }

  // Optional: Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'price': price,
      'image_urls': imageUrls,
      'category': category,
      'category_display': categoryDisplay,
      'is_in_wishlist': isInWishlist,
    };
  }
}
