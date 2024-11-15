import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/features/wigdets/image_widget.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  List<FashionProduct> products = [];

  @override
  void initState() {
    super.initState();

    products = UtilityClass.fashionStoreProducts
        .map((e) => FashionProduct.fromMap(e))
        .toList();
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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: Responsive.isMobile(context)
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal: Responsive.getSize(context).width * .05),
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                axisDirection: AxisDirection.down,
                crossAxisSpacing: 20,
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/product', extra: product);
                        },
                        child: FadeTransition(
                          opacity: _animation,
                          child: SizedBox(
                            width: size.width * .5,
                            height: index % 2 == 0
                                ? size.width * .60
                                : size.width * .54,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: size.width * .5,
                                  height: index % 2 == 0
                                      ? size.width * .60
                                      : size.width * .54,
                                  child: ImageWidget(url: product.image),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightColor,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 46,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightColor,
                                    ),
                                    child: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Text(product.productName),
                      ),
                      Text(context
                          .read<HomeProvider>()
                          .calculateAmount(product.price)),
                    ],
                  );
                })),
          ),
        )
      ],
    );
  }
}
