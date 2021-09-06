import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';

class LevelCurrentStore extends NotifierStore<Error, Level> {

  LevelCurrentStore() : super(null);

  void setLevel(Level level){
    update(level);
  }

}