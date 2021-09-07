import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository{
  Future<void> setTentativaUser(User user)async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;
    if (currentUser != null) {
      currentUser.set('respondeu_nivel_atual', true);
      ParseResponse response = await currentUser.update();
      if(response.success){
        print('ok');
      }
    }else{
    }

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
}