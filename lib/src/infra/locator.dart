import 'package:f/src/service/banco_service.dart';
import 'package:f/src/view_model/banco_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => BancoService());

  locator.registerFactory(() => BancoViewModel());
}
