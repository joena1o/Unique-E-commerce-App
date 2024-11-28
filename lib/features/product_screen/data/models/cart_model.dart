import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';

class CartItem {
  final FashionProduct product;
  final String? size; // Size is optional
  int quantity;

  CartItem({
    required this.product,
    this.size,
    this.quantity = 0,
  });

  // Convert to a Map
  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'size': size,
      'quantity': quantity,
    };
  }

  // Create a CartItem from a Map
  factory CartItem.fromMap(Map<String, dynamic> data) {
    return CartItem(
      product: FashionProduct.fromMap(data['product']),
      size: data['size'] as String,
      quantity: data['quantity'] as int,
    );
  }
}
