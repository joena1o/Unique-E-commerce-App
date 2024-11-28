import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/cart_model.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/utils/dialog_services.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> items;

  CartProvider({List<CartItem>? initialItems}) : items = initialItems ?? [];

  void addProduct(FashionProduct product, {String? size, int? quantity}) {
    final existingItem = items.indexWhere((item) =>
        item.product.productName == product.productName && item.size == size);
    if (existingItem == -1) {
      items
          .add(CartItem(product: product, size: size, quantity: quantity ?? 1));
    } else {
      items[existingItem].quantity = quantity!;
    }
    getIt<DialogServices>().showMessage("Item added to cart");
    notifyListeners();
  }

  // Remove a product or decrease its quantity
  void removeProduct(FashionProduct product, {String? size, int? quantity}) {
    final existingItem = items.indexWhere(
      (item) =>
          item.product.productName == product.productName &&
          item.size == size &&
          item.quantity == quantity,
    );
    if (existingItem != -1) {
      items.remove(items[existingItem]);
    }
    getIt<DialogServices>().showMessageError("Item has been from cart");
    notifyListeners();
  }

  // Check if a product with a specific size is in the cart
  bool isInCart(FashionProduct product, {String? size}) {
    return items.any(
      (item) =>
          item.product.productName == product.productName && item.size == size,
    );
  }

  // Get the total number of items in the cart
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  // Get the total price of the cart
  double get totalPrice {
    return items.fold(
        0, (sum, item) => sum + item.product.price * item.quantity);
  }
}
