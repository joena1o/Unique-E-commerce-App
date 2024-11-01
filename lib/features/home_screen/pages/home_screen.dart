import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/drawer_items.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/end_drawer_items.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/links_area.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/full_screen_widgets/full_screen_navbar.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/info_banner.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/top_banner.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/top_search_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        width: Responsive.getSize(context).width * .7,
        shape: const RoundedRectangleBorder(),
        child: DrawerItems(
            callback: () => _scaffoldKey.currentState?.closeDrawer()),
      ),
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        width: Responsive.getSize(context).width * .85,
        child: EndDrawerItems(
            callback: () => _scaffoldKey.currentState?.closeEndDrawer()),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  const TopBanner(),
                  const InfoBanner(),
                  Responsive.isMobile(context)
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppColors.borderGray)),
                              color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                                  icon: const Icon(Icons.menu)),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    showTopSheet(
                                      context,
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: IconButton(
                                                onPressed: () {
                                                  overlayEntry.remove();
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: AppColors
                                                          .borderGray, // Border color
                                                      width:
                                                          2.0, // Border width
                                                      style: BorderStyle
                                                          .solid, // Border style
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                                  suffixIcon:
                                                                      IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .search),
                                                                  ),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Search..")),
                                                    )
                                                  ],
                                                )),
                                            Container(height: 200)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.search)),
                              const Spacer(),
                              Text("UNIQUE",
                                  style: UtilityClass.headerStyleBlack),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline)),
                              IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState?.openEndDrawer();
                                  },
                                  icon: const Icon(Icons.shopping_bag_outlined))
                            ],
                          ),
                        )
                      : const FullScreenNavbar(),
                  widget.child,
                  const SizedBox(
                    height: 40,
                  ),
                  const LinksArea(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }),
          ),
          Positioned(
              top: 70,
              right: 30,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: const Row(
                    children: [
                      Icon(Icons.cancel_rounded),
                      SizedBox(width: 20),
                      Text("NGN"),
                      SizedBox(width: 20),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.chat,
          color: AppColors.lightColor,
        ),
      ),
      floatingActionButtonLocation: Responsive.isMobile(context)
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomAppBar(
              notchMargin: 0,
              height: 70,
              color: Colors.transparent,
              child: Padding(
                padding: UtilityClass.horizontalPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/');
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.home_filled,
                            size: 28,
                          ),
                          Text("HOME", style: UtilityClass.bottomNavStyleBlack)
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          context.go('/products');
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.storefront,
                              size: 28,
                            ),
                            Text("SHOP",
                                style: UtilityClass.bottomNavStyleBlack)
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          showTopSheet(
                            context,
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {
                                        overlayEntry.remove();
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: AppColors
                                                .borderGray, // Border color
                                            width: 2.0, // Border width
                                            style: BorderStyle
                                                .solid, // Border style
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                          Icons.search),
                                                    ),
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    hintText: "Search..")),
                                          )
                                        ],
                                      )),
                                  Container(height: 200)
                                ],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 28,
                            ),
                            Text("SEARCH",
                                style: UtilityClass.bottomNavStyleBlack)
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          context.go('/account');
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.person_3_outlined,
                              size: 28,
                            ),
                            Text("ACCOUNT",
                                style: UtilityClass.bottomNavStyleBlack)
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          context.go('/wishlist');
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              size: 28,
                            ),
                            Text("WISHLIST",
                                style: UtilityClass.bottomNavStyleBlack)
                          ],
                        ))
                  ],
                ),
              ),
            )
          : null,
    );
  }

  late OverlayEntry overlayEntry;

  void showTopSheet(BuildContext context, Widget child) {
    final overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background shadow
          GestureDetector(
            onTap: () =>
                overlayEntry.remove(), // Dismiss top sheet on background tap
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Adjust opacity for shadow effect
            ),
          ),
          // Top sheet
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopSheet(child: child),
          ),
        ],
      ),
    );

    overlay.insert(overlayEntry);
  }
}
