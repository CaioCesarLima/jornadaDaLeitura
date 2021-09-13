import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository {
  Future<void> setTentativaUser(User user) async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;
    if (currentUser != null) {
      currentUser.set('respondeu_nivel_atual', true);
      ParseResponse response = await currentUser.update();
      if (response.success) {
        print('ok');
      }
    } else {}

    //Checks whether the user's session token is valid
    // final ParseResponse parseResponse =
    //     await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    // if (parseResponse?.success == null || !parseResponse!.success) {
    //   //Invalid session. Logout
    //   await currentUser.logout();
    //   return false;
    // } else {
    //   return true;
    // }
  }

  Future<List<User>> searchUser(String search) async {
    QueryBuilder<ParseUser> queryBuilder =
        QueryBuilder<ParseUser>(ParseUser.forQuery());
    queryBuilder.whereContains('name', search);
    ParseResponse response = await queryBuilder.query();

    if (response.success && response.results != null) {
      List responseList = response.results as List<ParseObject>;
      return responseList
          .map((e) => User(
                id: e['objectId'],
                level: e['level'],
                name: e['name'],
                respondeuNivelAtual: e['respondeu_nivel_atual'],
                isAdmin: e['isAdmin'],
                permitirRepetir: e['permitir_repetir'],
              ))
          .toList();
    } else {
      return [];
    }
  }

  Future<bool> repetirProva(String objectId) async {
    final ParseCloudFunction function = ParseCloudFunction('editRepondeuUser');
    final Map<String, dynamic> params = <String, dynamic>{
      'objectId': objectId,
      'respondeu': false
    };
    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    return parseResponse.success ? true : false;
  }

  Future<bool> nextLevel(String objectId, int level) async {
    final ParseCloudFunction function = ParseCloudFunction('editUserProperty');
    final Map<String, dynamic> params = <String, dynamic>{
      'objectId': objectId,
      'newLevel': level + 1
    };
    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    return parseResponse.success ? true : false;
  }

  Future<String> novoUsuario(
      String username, String password, String name) async {
    ParseUser user = ParseUser(username, password, '$username@email.com');
    user.set('name', name);

    ParseResponse response = await user.save();

    if (response.success) {
      return "Usuário cadastrado com sucesso!";
    } else {
      return response.error.message;
    }
  }
}
