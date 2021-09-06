import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginRepository{
  Future<ParseResponse> login(String username, String password) async {
    ParseUser user  = ParseUser(username, password, null);

    ParseResponse response = await user.login();

    if(response.success){
      return response;
    }else{
      Future.error('erro');
    }
  }
}