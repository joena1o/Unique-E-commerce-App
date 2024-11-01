import 'package:beunique_ecommerce/features/home_screen/widgets/bottom_banner.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/carousel_area.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarouselArea(),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Shop Trending",
              style: UtilityClass.titleStyleBlack,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: 100,
              child: Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const ProductGridView(),
        const CarouselArea(),
        const BottomBanner(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
