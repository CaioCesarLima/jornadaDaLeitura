import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/repositories/level_repository.dart';

class LevelTripleStore extends NotifierStore<Error, Level> {
  final levelRepository = LevelRepository();

  LevelTripleStore() : super(null);

  // Future<void> getLevel() async{
  //   setLoading(true);
  //   try{
  //     Level level = await levelRepository.getLevel(1);
  //   update(level);
  //   }catch(e){
  //     setError(e);
  //   }finally{
  //     setLoading(false);
  //   }
    
  //}
}