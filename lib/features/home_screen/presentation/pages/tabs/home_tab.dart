import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/bottom_banner.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/carousel_area.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );

    // Trigger animation after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Start the animation once the app is loaded/rendered
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(opacity: _animation, child: const CarouselArea()),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Shop Trending",
              style: FontClass.titleStyleBlack,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: 120,
              child: Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const ProductGridView(),
        const SizedBox(
          height: 20,
        ),
        const CarouselArea(),
        const BottomBanner(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
