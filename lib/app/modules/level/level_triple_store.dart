import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/modules/user_logged_store.dart';
import 'package:jornada_da_leitura/app/repositories/level_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils.dart';

class LevelTripleStore extends NotifierStore<Error, Level> {
  final levelRepository = LevelRepository();
  final userController = Modular.get<UserLoggedStore>();

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
  void setUserTentativa(String urlYoutube, BuildContext context) async {
    if (userController.state.respondeuNivelAtual) {
      Utils.showToast(context, 'Aguarde a correção do formulário!');
    } else {
      await userController.setTentativaUser();
      userController.state.respondeuNivelAtual = true;
      update(null);
      _launchURL(urlYoutube);
    }
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  
  //}
}
