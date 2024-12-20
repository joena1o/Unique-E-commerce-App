import 'package:beunique_ecommerce/features/home_screen/data/repository/auth_repository.dart';
import 'package:beunique_ecommerce/utils/dialog_services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<DialogServices>(() => DialogServices());
}
