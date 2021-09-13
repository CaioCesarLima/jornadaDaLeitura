import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jornada_da_leitura/app/modules/admin/user/user_triple_store.dart';

class UserPage extends StatefulWidget {
  final String title;
  const UserPage({Key key, this.title = "Novo Usuário"}) : super(key: key);
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final store = Modular.get<UserTripleStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                  //label: Text('Senha'),
                  labelText: 'Nome do aluno',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.deepPurpleAccent,
                  focusColor: Colors.deepPurpleAccent,
                  //hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              controller: userName,
              decoration: InputDecoration(

                  //label: Text('Senha'),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.deepPurpleAccent,
                  focusColor: Colors.deepPurpleAccent,
                  //hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                  //label: Text('Senha'),
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.deepPurpleAccent,
                  focusColor: Colors.deepPurpleAccent,
                  //hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              store.criarUsuario(
                  name.text, userName.text, password.text, context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Criar Usuário',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
