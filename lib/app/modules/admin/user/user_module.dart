
import 'package:jornada_da_leitura/app/modules/admin/user/user_page.dart';
import 'package:jornada_da_leitura/app/modules/admin/user/user_triple_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserTripleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UserPage()),
  ];
}
