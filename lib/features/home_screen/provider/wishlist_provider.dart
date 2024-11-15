import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/utils/dialog_services.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<FashionProduct> wishList = [];
  List<FashionProduct> get getWishist => wishList;

  void addWishList(FashionProduct product) {
    if (wishList.contains(product)) {
      wishList.remove(product);
      getIt<DialogServices>()
          .showMessageError("Item has been removed from wishlist");
    } else {
      wishList.add(product);
      getIt<DialogServices>().showMessage("Item added to wishlist");
    }
    notifyListeners();
  }
}
