import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key key, this.title = "Usuários"}) : super(key: key);
  @override
  UsersPageState createState() => UsersPageState();
}
class UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: (){
                Modular.to.navigate('/admin/levels');
              },
              child: Text('Editar Níveis', style: TextStyle(
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: ListView.separated(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Slidable(
                      child: ListTileCustom(),
                      actionExtentRatio: 0.25,
                      actionPane: SlidableDrawerActionPane(),
                      actions: [
                        IconSlideAction(
                            caption: 'Repetir',
                            color: Colors.red[200],
                            icon: Icons.wrong_location,
                            onTap: () {}),
                        IconSlideAction(
                            caption: 'Passar de nível',
                            color: Colors.green[400],
                            icon: Icons.check,
                            onTap: () {}),
                        IconSlideAction(
                            caption: 'Editar',
                            color: Colors.blue[400],
                            icon: Icons.check,
                            onTap: () {
                              Modular.to.navigate('/admin/users/user');
                            }),
                      ]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ListTileCustom() {
  return ListTile(
    title: Text('Nome do usuário'),
    leading: Icon(
      Icons.arrow_forward,
      color: Colors.white,
    ),
    subtitle: Row(
      children: [
        Text('Nível 1'),
      ],
    ),
  );
}
