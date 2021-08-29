import 'package:flutter_modular/flutter_modular.dart';

import 'user/user_module.dart';

class AdminModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/user', module: UserModule()),
  ];

}