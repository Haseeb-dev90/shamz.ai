import 'package:get_it/get_it.dart';
import '../presentation/authentication/data/authentication_provider.dart';


final GetIt locator = GetIt.instance;

void initServices() {
  ///
  /// Register provider
  ///
  locator.registerSingleton<AuthenticationProvider>(AuthenticationProvider());

}
