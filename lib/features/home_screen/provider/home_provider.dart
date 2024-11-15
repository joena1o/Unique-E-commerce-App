import 'package:beunique_ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeProvider extends ChangeNotifier {
  Currency selectedCurrency = Currency.nigeria;

  final formatter = NumberFormat('#,##0.##');

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
