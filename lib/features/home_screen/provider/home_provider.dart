import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/main.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeProvider extends ChangeNotifier {
  Currency selectedCurrency = Currency.nigeria;

  final formatter = NumberFormat('#,##0.##');
  String searchText = '';
  List<FashionProduct> searchedProducts = [];
  String? seletedCategory;
  List<FashionProduct> categoryProducts = [];

  Function? scrollCallBack;

  setScrollCallback(Function scrollCallbackValue) {
    scrollCallBack = scrollCallbackValue;
  }

  scrollToTop() {
    scrollCallBack!();
  }

  setCategoryValue(String? category) {
    seletedCategory = category;
    if (category == "All") {
      categoryProducts = UtilityClass.fashionStoreProducts
          .map((e) => FashionProduct.fromMap(e))
          .toList();
    } else {
      final filteredResult = UtilityClass.fashionStoreProducts
          .where((e) => e['category'] == category)
          .toList();
      categoryProducts =
          filteredResult.map((e) => FashionProduct.fromMap(e)).toList();
    }
    notifyListeners();
  }

  setSearchText(String text) {
    searchText = text;
    final result = UtilityClass.fashionStoreProducts.where((e) =>
        e['productName'].toString().toLowerCase().contains(text.toLowerCase()));
    searchedProducts = (text != "")
        ? result.map((e) => FashionProduct.fromMap(e)).toList()
        : [];
    notifyListeners();
  }

  setCurrency(Currency currency) {
    selectedCurrency = currency;
    notifyListeners();
  }

  String calculateAmount(double price) {
    final value = price * selectedCurrency.exchangeRateToUSD;
    return "${selectedCurrency.symbol} ${formatAmount(value.toStringAsFixed(selectedCurrency.decimalPlace))}";
  }

  String formatAmount(dynamic amount) {
    try {
      // Convert to a numeric type if it's a String
      num numericAmount = amount is String ? num.parse(amount) : amount;
      // Use NumberFormat to format the number
      final formatter = NumberFormat('#,##0.##');
      return formatter.format(numericAmount);
    } catch (e) {
      // Handle invalid input gracefully
      return 'Invalid amount';
    }
  }
}
