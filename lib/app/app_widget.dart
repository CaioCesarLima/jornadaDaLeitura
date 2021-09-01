import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jornada da Leitura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Color(0xffD9BE3B),
              primary: Color(0xff332362),
            ),
      ),
    ).modular();
  }
}
