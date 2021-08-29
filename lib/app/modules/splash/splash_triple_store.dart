import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SplashTripleStore extends NotifierStore<Exception, int> {

  SplashTripleStore() : super(0);
  Future<void> getUser() async{
    setLoading(true);

    await Future.delayed(Duration(seconds: 1));
    Modular.to.pushNamed('/login/');
  }
}