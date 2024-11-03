import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: AppColors.darkColor),
        width: Responsive.getSize(context).width,
        child: Text(
          "Express shipping on orders over \$180",
          textAlign: TextAlign.center,
          style: UtilityClass.bannerLabelWhite,
        ),
      ),
    );
  }
}
