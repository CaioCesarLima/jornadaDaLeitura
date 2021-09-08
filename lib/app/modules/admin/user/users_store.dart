import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:jornada_da_leitura/app/repositories/user_repository.dart';

class UsersStore extends NotifierStore<Error, List<User>> {
  final userrepository = UserRepository();
  UsersStore() : super(null);

  Future<void> search(String search) async {
    setLoading(true);
    try {
      //await userrepository.searchUser(search);
      List<User> usersSearch = await userrepository.searchUser(search);
      update(usersSearch);
    } catch (e) {
    } finally {
      setLoading(false);
    }
  }

  Future<void> liberarNivelUser(int index) async {
    setLoading(true);
    try {
      bool response = await userrepository.repetirProva(state[index].id);
      
        state[index].respondeuNivelAtual = false;

      List<User> newList = [...state];
      update(newList);
      
      
    } catch (e) {
    } finally {
      setLoading(false);
      print(state[index].respondeuNivelAtual);
    }
    
  }

  Future<void> nextLevel(int index) async {
    setLoading(true);
    try {
      bool response = await userrepository.nextLevel(state[index].id, state[index].level);
      
        state[index].level += 1;

      List<User> newList = [...state];
      update(newList);
      
      
    } catch (e) {
    } finally {
      setLoading(false);
      print(state[index].respondeuNivelAtual);
    }
    
  }
}
