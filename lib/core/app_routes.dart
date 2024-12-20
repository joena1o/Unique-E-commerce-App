import 'package:beunique_ecommerce/features/about_us_screen/presentation/pages/about_us_screen.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/home_screen.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/account_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/home_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/product_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/wishlist_tab.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/features/product_screen/presentation/pages/product_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeTab()),
        ),
        GoRoute(
          path: '/products',
          name: 'products',
          pageBuilder: (context, state) => NoTransitionPage(
              child: ProductTab(
            categoryType: state.extra as bool?,
          )),
        ),
        GoRoute(
          path: '/account',
          name: 'account',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AccountTab()),
        ),
        GoRoute(
          path: '/wishlist',
          name: 'wishlist',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: WishlistTab()),
        ),
        GoRoute(
          path: '/about',
          name: 'about',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AboutUsScreen()),
        ),
        GoRoute(
            path: '/product',
            name: 'product',
            pageBuilder: (context, state) => NoTransitionPage(
                child: ProductScreen(product: state.extra as FashionProduct))),
      ],
    ),
  ],
);

GoRouter get router => _router;
