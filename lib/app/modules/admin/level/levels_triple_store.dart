import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/repositories/level_repository.dart';

class LevelsTripleStore extends NotifierStore<Error, List<Level>> {
  final levelRepository = LevelRepository();
  LevelsTripleStore() : super([]);

  Future<void> getLevels() async {
    setLoading(true);
    try {
      List<Level> levels = await levelRepository.getAllLevel();
      update(levels);
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
