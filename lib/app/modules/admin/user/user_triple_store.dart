import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/repositories/user_repository.dart';
import 'package:jornada_da_leitura/app/utils.dart';

class UserTripleStore extends NotifierStore<Exception, int> {
  final userRepository = UserRepository();

  UserTripleStore() : super(0);

  Future<void> criarUsuario(String name, String userName, String password,
      BuildContext context) async {
    String response =
        await userRepository.novoUsuario(userName, password, name);

    Utils.showToast(context, response);
  }
}
