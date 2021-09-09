import 'package:jornada_da_leitura/app/modules/admin/user/users_store.dart';

import 'package:jornada_da_leitura/app/modules/admin/user/user_page.dart';
import 'package:jornada_da_leitura/app/modules/admin/user/user_triple_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jornada_da_leitura/app/modules/admin/user/users_page.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersStore()),
    Bind.lazySingleton((i) => UserTripleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => UsersPage()),
    ChildRoute('/user', child: (_, args) => UserPage()),
  ];
}
