import 'package:beunique_ecommerce/core/app_routes.dart';
import 'package:beunique_ecommerce/core/config/app_theme.dart';
import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/home_screen/data/repository/auth_repository.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/account_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/cart_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/wishlist_provider.dart';
import 'package:beunique_ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: depend_on_referenced_packages
// import "package:flutter_web_plugins/flutter_web_plugins.dart"
//     show usePathUrlStrategy;

enum Currency {
  nigeria('₦', 1800, 0), // 1 Naira ≈ 0.0013 USD
  usd('\$', 1.0, 2), // 1 USD = 1.0 USD
  euros('€', 0.9457, 2); // 1 Euro ≈ 1.1 USD

  final String symbol;
  final double exchangeRateToUSD;
  final int decimalPlace;

  const Currency(this.symbol, this.exchangeRateToUSD, this.decimalPlace);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // usePathUrlStrategy();
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaler:
                const TextScaler.linear(1.0)), // Set to 1.0 to prevent scaling
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) =>
                    AccountProvider(authRepository: getIt<AuthRepository>())),
            ChangeNotifierProvider(create: (context) => HomeProvider()),
            ChangeNotifierProvider(create: (context) => WishlistProvider()),
            ChangeNotifierProvider(create: (context) => CartProvider()),
          ],
          child: MaterialApp.router(
            routerConfig: router,
            title: 'Flutter Demo',
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: MainAppTheme.lightTheme,
          ),
        ));
  }
}
