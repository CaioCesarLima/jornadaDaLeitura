import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:jornada_da_leitura/app/modules/user_logged_store.dart';
import 'package:jornada_da_leitura/app/repositories/login_repository.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginTripleStore extends NotifierStore<Error, bool> {
  final loginRepository = LoginRepository();
  final userLoggedStore = Modular.get<UserLoggedStore>();

  LoginTripleStore() : super(false);

  Future<void> login(String username, String password)async{
    setLoading(true);
    try{
      ParseResponse response = await loginRepository.login(username, password);
      print(response.result);
      var result = response.result;
      User user = User(id: result['objectId'], name: result['name'], level: result['level'], permitirRepetir: result['permitir_repetir'], respondeuNivelAtual: result['respondeu_nivel_atual'], isAdmin: result['isAdmin']);
      userLoggedStore.setUser(user);
      if(user.isAdmin){
        Modular.to.navigate('/admin/users');
      }else{
        Modular.to.navigate('/home');
      }
      update(true);
    }catch(e){
      print(e);
      setError(e);
    }
    
    setLoading(false);
  }
}