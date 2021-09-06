import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:jornada_da_leitura/app/modules/user_logged_store.dart';
import 'package:jornada_da_leitura/app/repositories/level_repository.dart';

class HomeStore extends NotifierStore<Error, User> {
  final levelRepository = LevelRepository();
  final userLoggedStore = Modular.get<UserLoggedStore>();
  HomeStore() : super(null);

  void setUser(){
    update(userLoggedStore.state);
  }
  Future<void> goToLevel() async {
    setLoading(true);
    try{
      Level level = await levelRepository.getLevel(1);
      Modular.to.navigate('/home/level', arguments: level);
    }catch(e){
      print(e.toString());
    }finally{
      setLoading(false);
    }
  }
}