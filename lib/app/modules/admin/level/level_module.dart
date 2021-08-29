import 'package:flutter_modular/flutter_modular.dart';

import 'level_triple_store.dart';

class LevelModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LevelTripleStore()),
  ];

  @override
  final List<ModularRoute> routes = [];

}