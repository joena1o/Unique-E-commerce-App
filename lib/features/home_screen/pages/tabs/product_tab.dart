import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, bottom: 5),
            child: Text("Products",
                style: UtilityClass.extraLargeHeaderStyleBlackNormal),
          ),
          BreadCrumb(
            items: <BreadCrumbItem>[
              BreadCrumbItem(content: const Text('Home')),
              BreadCrumbItem(content: const Text('Products')),
            ],
            divider: Icon(
              Icons.chevron_right,
              color: AppColors.borderGray,
            ),
          ),
          const SizedBox(
            height: 58,
          ),
          Padding(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: UtilityClass.buttonDecorationOnlyOutline,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.tune_outlined,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("FILTER", style: UtilityClass.buttonStyleBlackBold)
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: UtilityClass.setButtonOutlineDecoration(
                      AppColors.borderGray),
                  child: const Row(
                    children: [
                      Text("Alphabetically, A-Z"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.sort,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ProductGridView()
        ],
      ),
    );
  }
}
