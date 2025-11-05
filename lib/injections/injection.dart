import 'package:get_it/get_it.dart';

import '../data/providers/bottom_navbar_provider.dart';

final injectionLocator = GetIt.instance;

void setupInjections() {
  //TODO: 注册需要依赖注入的类

  injectionLocator.registerLazySingleton<BottomNavbarProvider>(
    () => BottomNavbarProvider(),
  );
  //     .registerSingleton<BottomNavbarProvider>(BottomNavbarProvider());
  // injectionLocator.registerSingleton<LoginController>(LoginController());
  // injectionLocator.registerSingleton<UserInfoProvider>(UserInfoProvider());
  // injectionLocator
  //     .registerSingleton<UikitRefreshProvider>(UikitRefreshProvider());
  // injectionLocator.registerSingleton<AuthProvider>(AuthProvider());
}
