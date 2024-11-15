import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/wishlist_provider.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:provider/provider.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38.0, bottom: 5),
          child: Text("WishList",
              style: FontClass.extraLargeHeaderStyleBlackNormal),
        ),
        BreadCrumb(
          items: <BreadCrumbItem>[
            BreadCrumbItem(content: const Text('Home')),
            BreadCrumbItem(content: const Text('Wishlist')),
          ],
          divider: Icon(
            Icons.chevron_right,
            color: AppColors.borderGray,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<WishlistProvider>(builder: (context, provider, child) {
          return ProductGridView(
            products: provider.wishList,
          );
        })
      ],
    );
  }
}
