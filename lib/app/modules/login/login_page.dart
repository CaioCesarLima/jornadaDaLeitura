

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jornada_da_leitura/app/modules/login/login_triple_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "LoginPage"}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginTripleStore controller = Modular.get<LoginTripleStore>();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    "Uma Aventura espera por você!",
                    style: GoogleFonts.pacifico(
                        fontSize: 30, color: Colors.deepPurple[200]),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Acese agora mesmo',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hoverColor: Colors.deepPurpleAccent,
                              focusColor: Colors.deepPurpleAccent,
                              hintText: 'Login',
                              hintStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hoverColor: Colors.deepPurpleAccent,
                              focusColor: Colors.deepPurpleAccent,
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ScopedBuilder(
                        store: controller,
                        onLoading: ((context) => ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple)),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )),
                        onState: (context, state) => ElevatedButton(
                          onPressed: () {
                            controller.login(username.text.trim(), password.text.trim());
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple)),
                          child: Text('Acessar'),
                        ),
                        onError: (context, erro){
                          return Container(
                            child: Text(erro.toString()),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
