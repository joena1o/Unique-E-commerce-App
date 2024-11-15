import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class UtilityClass {
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets horizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  static String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static String? passwordValidator(String? value) {
    // Check if the password is empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    // Check password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for digits
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    // Check for special characters
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Password is valid
  }

  static String? firstNameValidator(String? value) {
    // Check if the first name is empty
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'First name can only contain letters';
    }

    return null; // First name is valid
  }

  static String? lastNameValidator(String? value) {
    // Check if the last name is empty
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'Last name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Last name can only contain letters';
    }

    return null; // Last name is valid
  }

//Button Container Styles

  static final buttonDecorationFill = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(0),
  );

  static BoxDecoration setButtonDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color, width: 2),
      color: color,
      borderRadius: BorderRadius.circular(0),
    );
  }

  static BoxDecoration setGradientDecoration(Color color1, Color color2) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(0),
    );
  }

  static final buttonDecorationOnlyOutline = BoxDecoration(
    border: Border.all(color: AppColors.secondaryColor, width: 1),
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(0),
  );

  static BoxDecoration setButtonOutlineDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color, width: 1),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(0),
    );
  }
//Button Container Styles'

  static List<Map<String, dynamic>> fashionStoreProducts = [
    {
      "productName": "Classic White T-Shirt",
      "price": 19.99,
      "image":
          "https://cdn.pixabay.com/photo/2023/02/06/15/11/moon-7772242_640.jpg",
      "category": "Clothing",
      "sizes": ["S", "M", "L", "XL"]
    },
    {
      "productName": "Stylish Blue Jeans",
      "price": 49.99,
      "image":
          "https://cdn.pixabay.com/photo/2024/01/29/19/38/forest-8540698_640.jpg",
      "category": "Clothing",
      "sizes": ["28", "30", "32", "34", "36"]
    },
    {
      "productName": "Elegant Leather Handbag",
      "price": 79.99,
      "image":
          "https://cdn.pixabay.com/photo/2024/09/01/11/36/tansy-9013813_640.jpg",
      "category": "Accessories",
      "sizes": [] // Handbags typically don't have sizes
    },
    {
      "productName": "Running Shoes",
      "price": 59.99,
      "image":
          "https://cdn.pixabay.com/photo/2023/07/26/22/05/sunflower-8152089_640.jpg",
      "category": "Footwear",
      "sizes": ["6", "7", "8", "9", "10", "11"]
    },
    {
      "productName": "Woolen Scarf",
      "price": 15.99,
      "image":
          "https://cdn.pixabay.com/photo/2024/03/12/13/13/woman-8628792_640.jpg",
      "category": "Accessories",
      "sizes": [] // Scarves generally don’t have sizes
    },
    {
      "productName": "Smart Watch",
      "price": 199.99,
      "image":
          "https://cdn.pixabay.com/photo/2023/12/21/07/39/christmas-baubles-8461383_640.jpg",
      "category": "Electronics",
      "sizes": [] // Electronics generally don’t have sizes
    },
    {
      "productName": "Black Leather Jacket",
      "price": 129.99,
      "image":
          "https://cdn.pixabay.com/photo/2022/06/07/16/22/drift-7248723_640.jpg",
      "category": "Clothing",
      "sizes": ["S", "M", "L", "XL", "XXL"]
    },
    {
      "productName": "Sunglasses",
      "price": 25.99,
      "image":
          "https://cdn.pixabay.com/photo/2024/09/16/04/14/family-9050396_640.jpg",
      "category": "Accessories",
      "sizes": [] // Sunglasses usually come in one standard size
    },
    {
      "productName": "Canvas Sneakers",
      "price": 39.99,
      "image":
          "https://cdn.pixabay.com/photo/2023/06/13/16/25/baby-8061294_640.jpg",
      "category": "Footwear",
      "sizes": ["5", "6", "7", "8", "9", "10"]
    },
    {
      "productName": "Sports Cap",
      "price": 12.99,
      "image":
          "https://cdn.pixabay.com/photo/2024/09/25/13/30/shell-9073724_640.jpg",
      "category": "Accessories",
      "sizes": ["S", "M", "L"] // Caps may have small, medium, and large sizes
    },
  ];

  static List<String> uniqueCategories = [
    "Clothing",
    "Accessories",
    "Footwear",
    "Electronics",
    "Jewelry"
  ];
}
