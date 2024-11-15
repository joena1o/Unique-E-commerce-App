import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/drawer_items.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/end_drawer_items.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/links_area.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/full_screen_widgets/full_screen_navbar.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/info_banner.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/mobile_navbar.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/top_banner.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/main.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/top_search_sheet.dart';
import 'package:provider/provider.dart';

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

  late ScrollController scrollController;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        width: Responsive.getSize(context).width * .9,
        child: EndDrawerItems(
            callback: () => {_scaffoldKey.currentState?.closeEndDrawer()}),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    const TopBanner(),
                    const InfoBanner(),
                    Responsive.isMobile(context)
                        ? MobileNavbar(
                            openEndDrawer: () =>
                                {_scaffoldKey.currentState?.openEndDrawer()},
                            openDrawer: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                            openSearch: () => openSearch(),
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
              child: PopupMenuButton<Currency>(
                color: Theme.of(context).scaffoldBackgroundColor,
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  // Handle menu item selection
                  context.read<HomeProvider>().setCurrency(value);
                },
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
                    )),
                itemBuilder: (BuildContext context) => const [
                  PopupMenuItem(
                    value: Currency.nigeria,
                    child: Text("NGN"),
                  ),
                  PopupMenuItem(
                    value: Currency.usd,
                    child: Text("USD"),
                  ),
                  PopupMenuItem(
                    value: Currency.euros,
                    child: Text("EUR"),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: AnimatedOpacity(
                opacity: showNavBar ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                    width: Responsive.getSize(context).width,
                    child: Responsive.isMobile(context)
                        ? MobileNavbar(
                            openEndDrawer: () =>
                                _scaffoldKey.currentState?.openEndDrawer(),
                            openDrawer: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                            openSearch: () => openSearch(),
                          )
                        : const FullScreenNavbar(),
                  ),
                ),
              ),
            ),
          ],
        ),
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
              padding: const EdgeInsets.symmetric(vertical: 12),
              notchMargin: 0,
              height: 70,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            size: 26,
                          ),
                          Text("HOME", style: FontClass.bottomNavStyleBlack)
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
                              size: 26,
                            ),
                            Text("SHOP", style: FontClass.bottomNavStyleBlack)
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
                              size: 26,
                            ),
                            Text("SEARCH", style: FontClass.bottomNavStyleBlack)
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
                              size: 26,
                            ),
                            Text("ACCOUNT",
                                style: FontClass.bottomNavStyleBlack)
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
                              size: 26,
                            ),
                            Text("WISHLIST",
                                style: FontClass.bottomNavStyleBlack)
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

  void openSearch() {
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
                      color: AppColors.borderGray, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle.solid, // Border style
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
                                icon: const Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search..")),
                    )
                  ],
                )),
            Container(height: 200)
          ],
        ),
      ),
    );
  }

  bool showNavBar = false;

  void _scrollListener() {
    if (scrollController.hasClients) {
      bool shouldShowNavBar = scrollController.position.pixels > 150;
      if (shouldShowNavBar != showNavBar) {
        setState(() => showNavBar = shouldShowNavBar);
        if (showNavBar) {
          // Restart the animation from the beginning when it becomes visible
          _controller.forward(from: 0.0);
        } else {
          // Reverse the animation when it becomes hidden
          _controller.reverse();
        }
      }
    }
  }
}
