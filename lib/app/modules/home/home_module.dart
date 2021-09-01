 import 'package:flutter_modular/flutter_modular.dart';
import 'package:jornada_da_leitura/app/modules/level/level_page.dart';
 import '../home/home_store.dart'; 
 
 import 'home_page.dart';
  
 class HomeModule extends Module {
   @override
   final List<Bind> binds = [
  Bind.lazySingleton((i) => HomeStore()),
  ];
 
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/level', child: (_, args) => LevelPage(levelID: 1,)),
  ];
 }