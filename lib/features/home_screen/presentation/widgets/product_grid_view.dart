import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/wishlist_provider.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/features/wigdets/image_widget.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView(
      {super.key, this.products, this.fromState, this.fromCategory});

  final List<FashionProduct>? products;
  final bool? fromState;
  final bool? fromCategory;

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

    if (widget.products == null && widget.fromState != true) {
      products = UtilityClass.fashionStoreProducts
          .map((e) => FashionProduct.fromMap(e))
          .toList();
    } else if (widget.products != null) {
      products = widget.products!;
    }

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
    if (widget.fromState == true) {
      // Displays Product from search Result
      products = context.watch<HomeProvider>().searchedProducts;
    }
    if (widget.fromCategory == true) {
      // Displays Product from Categories
      products = context.watch<HomeProvider>().categoryProducts;
    }
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: Responsive.isMobile(context)
              ? const EdgeInsets.symmetric(horizontal: 10)
              : Responsive.isTablet(context)
                  ? const EdgeInsets.symmetric(horizontal: 40)
                  : EdgeInsets.symmetric(
                      horizontal: Responsive.getSize(context).width * .14),
          padding: const EdgeInsets.all(15.0),
          child:
              Consumer<WishlistProvider>(builder: (context, provider, child) {
            return products.isEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text("No Items found"),
                      const SizedBox(
                        height: 30,
                      ),
                      Icon(
                        Icons.remove_shopping_cart_outlined,
                        size: 154,
                        color: AppColors.inactiveColor,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        axisDirection: AxisDirection.down,
                        crossAxisSpacing: 25,
                        children: List.generate(products.length, (index) {
                          final product = products[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<HomeProvider>().scrollToTop();
                                  GoRouter.of(context)
                                      .go('/product', extra: product);
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
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            width: size.width * .5,
                                            height: index % 2 == 0
                                                ? size.width * .60
                                                : size.width * .54,
                                            child:
                                                ImageWidget(url: product.image),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<WishlistProvider>()
                                                  .addWishList(product);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: AppColors.lightColor,
                                              ),
                                              child: Icon(
                                                provider.wishList.any((e) =>
                                                        product.productName ==
                                                        e.productName)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 50,
                                          right: 10,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: AppColors.lightColor,
                                            ),
                                            child: const Icon(
                                              Icons.remove_red_eye_outlined,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15.0, bottom: 5),
                                child: Text(product.productName),
                              ),
                              Consumer<HomeProvider>(
                                  builder: (context, provider, child) {
                                return Text(
                                  context
                                      .read<HomeProvider>()
                                      .calculateAmount(product.price),
                                  style: FontClass.priceFont,
                                );
                              }),
                            ],
                          );
                        })),
                  );
          }),
        )
      ],
    );
  }
}
