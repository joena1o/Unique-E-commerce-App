class FashionProduct {
  final String productName;
  final double price;
  final String image;
  final String category;
  final List<String> sizes;

  // Constructor
  FashionProduct({
    required this.productName,
    required this.price,
    required this.image,
    required this.category,
    required this.sizes,
  });

  // Factory method to create an instance from a Map
  factory FashionProduct.fromMap(Map<String, dynamic> data) {
    return FashionProduct(
      productName: data['productName'] as String,
      price: (data['price'] as num).toDouble(),
      image: data['image'] as String,
      category: data['category'] as String,
      sizes: List<String>.from(data['sizes'] ?? []),
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'price': price,
      'image': image,
      'category': category,
      'sizes': sizes,
    };
  }
}
