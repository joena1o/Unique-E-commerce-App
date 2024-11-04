import 'package:beunique_ecommerce/features/about_us_screen/presentation/pages/about_us_screen.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/home_screen.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/account_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/home_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/product_tab.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/pages/tabs/wishlist_tab.dart';
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
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProductTab()),
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
          path: '/product/:id',
          name: 'product',
          pageBuilder: (context, state) {
            // Retrieve the 'id' parameter from the state.
            final String id = state.params['id']!;
            return NoTransitionPage(child: ProductScreen(productId: id));
          },
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;
