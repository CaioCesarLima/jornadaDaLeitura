import 'package:flutter_modular/flutter_modular.dart';

import 'level_page.dart';
import 'level_triple_store.dart';
import 'levels_page.dart';

class LevelModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LevelTripleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LevelsPage()),
    ChildRoute('/level', child: (_, args) => LevelPage()),
  ];

}