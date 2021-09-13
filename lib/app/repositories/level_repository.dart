import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LevelRepository {
  Future<Level> getLevel(int level) async {
    QueryBuilder<ParseObject> queryLevel =
        QueryBuilder<ParseObject>(ParseObject('Level'));
    queryLevel.whereEqualTo('level', 1);

    ParseResponse response = await queryLevel.query();
    if (response.success) {
      int levelint = response.result[0]['level'];
      Level levelresponse = Level(
          id: response.result[0]['objetcId'] as String,
          level: levelint,
          trecho: response.result[0]['trecho'] as String,
          videoYoutube: response.result[0]['video_youtube'] as String,
          urlFormulario: response.result[0]['url_formulario'] as String);

      print(levelresponse.id);
      return levelresponse;
    } else {
      return Future.error(response.error.message);
    }
  }

  Future<List<Level>> getAllLevel() async {
    ParseResponse response = await ParseObject('Level').getAll();

    if (response.success) {
      List<Level> levelresponse = response.results
          .map((e) => Level(
              id: e['objectId'] as String,
              level: e['level'] as int,
              trecho: e['trecho'] as String,
              videoYoutube: e['video_youtube'] as String,
              urlFormulario: e['url_formulario'] as String))
          .toList();
      print(levelresponse[0].id);
      return levelresponse;
    } else {
      return Future.error(response.error.message);
    }
  }
}
