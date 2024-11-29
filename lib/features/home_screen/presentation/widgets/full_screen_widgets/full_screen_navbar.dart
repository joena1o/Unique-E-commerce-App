import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FullScreenNavbar extends StatefulWidget {
  const FullScreenNavbar(
      {super.key,
      required this.openDrawer,
      required this.openEndDrawer,
      required this.openSearch});

  final Function openDrawer;
  final Function openEndDrawer;
  final Function openSearch;

  @override
  State<FullScreenNavbar> createState() => _FullScreenNavbarState();
}

class _FullScreenNavbarState extends State<FullScreenNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderGray)),
          color: Colors.white),
      width: Responsive.getSize(context).width,
      child: Padding(
        padding: UtilityClass.horizontalPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  context.go("/");
                },
                child: Text("UNIQUE", style: FontClass.headerStyleBlack)),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go("/");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "HOME",
                        style: FontClass.navFontBlack,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go("/about");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "ABOUT US",
                        style: FontClass.navFontBlack,
                      ),
                    ),
                  ),
                  ...UtilityClass.uniqueCategories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeProvider>().setCategoryValue(category);
                        context.go("/products", extra: true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          category.toUpperCase(),
                          style: FontClass.navFontBlack,
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "CONTACT",
                      style: FontClass.navFontBlack,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.openSearch();
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  context.read<HomeProvider>().scrollToTop();
                  context.go('/account');
                },
                icon: const Icon(Icons.person_outline)),
            IconButton(
                onPressed: () {
                  context.read<HomeProvider>().scrollToTop();
                  context.go('/wishlist');
                },
                icon: const Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: () {
                  widget.openEndDrawer();
                },
                icon: const Icon(Icons.shopping_bag_outlined))
          ],
        ),
      ),
    );
  }
}
