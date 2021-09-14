import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/repositories/level_repository.dart';

class LevelTripleStore extends NotifierStore<Exception, int> {
  final levelRepository = LevelRepository();

  LevelTripleStore() : super(0);

  Future<void> salvarLevel(String trecho, String videoYoutube, String urlFormulario, String id, int level)async{
    try{
      await levelRepository.saveAlteracoes(trecho, videoYoutube, urlFormulario, id, level);
    }catch(e){
      print(e);
    }finally{
      setLoading(false);
    }
  }
}