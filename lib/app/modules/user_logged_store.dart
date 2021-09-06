import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';

class UserLoggedStore extends NotifierStore<Exception, User> {

  UserLoggedStore() : super(null);

  setUser(User user){
    update(user);
  }

}