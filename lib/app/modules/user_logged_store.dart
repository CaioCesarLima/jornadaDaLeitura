import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:jornada_da_leitura/app/repositories/user_repository.dart';

class UserLoggedStore extends NotifierStore<Exception, User> {
  final userRepository = UserRepository();
  

  UserLoggedStore() : super(null);

  setUser(User user){
    update(user);
  }
  Future<void> setTentativaUser()async{
    await userRepository.setTentativaUser(state);
  }
}