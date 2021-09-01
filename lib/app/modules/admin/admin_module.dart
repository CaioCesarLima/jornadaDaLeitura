import 'package:flutter_modular/flutter_modular.dart';

import 'level/level_module.dart';
import 'user/user_module.dart';

class AdminModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/users', module: UserModule()),
    ModuleRoute('/levels', module: LevelModule()),
  ];

}