import 'package:beunique_ecommerce/features/home_screen/data/repository/aurh_respository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
