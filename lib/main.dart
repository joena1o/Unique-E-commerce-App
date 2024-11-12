import 'package:beunique_ecommerce/core/app_routes.dart';
import 'package:beunique_ecommerce/core/config/app_theme.dart';
import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/home_screen/data/repository/auth_repository.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/account_provider.dart';
import 'package:beunique_ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: depend_on_referenced_packages
// import "package:flutter_web_plugins/flutter_web_plugins.dart"
//     show usePathUrlStrategy;

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
            ChangeNotifierProvider(create: (context) => AccountProvider(authRepository: getIt<AuthRepository>())) ,
          ],
          child: MaterialApp.router(
            routerConfig: router,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: MainAppTheme.lightTheme,
          ),
        ));
  }
}
