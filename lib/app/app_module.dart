import 'package:jornada_da_leitura/app/modules/level_current_store.dart';
import 'package:jornada_da_leitura/app/modules/user_logged_store.dart';
import 'package:jornada_da_leitura/app/modules/level/level_triple_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/admin/admin_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LevelCurrentStore()),
    Bind.lazySingleton((i) => UserLoggedStore()),
    Bind.lazySingleton((i) => LevelTripleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/admin', module: AdminModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
