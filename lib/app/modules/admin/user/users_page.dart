import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:jornada_da_leitura/app/modules/admin/user/users_store.dart';
import 'package:jornada_da_leitura/app/utils.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key key, this.title = "Usuários"}) : super(key: key);
  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends ModularState<UsersPage, UsersStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: (){
              Utils.logout();
            }, icon: Icon(Icons.exit_to_app),
          ),
        ),
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                Modular.to.navigate('/admin/levels');
              },
              child: Text(
                'Editar Níveis',
                style: TextStyle(color: Colors.white),
              ),
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
              onFieldSubmitted: (value) {
                store.search(value);
              },
              decoration: InputDecoration(
                  //label: Text('Senha'),
                  labelText: 'Pesquisa',
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
              child: ScopedBuilder<UsersStore, dynamic, List<User>>(
            onLoading: (context) => Center(
              child: CircularProgressIndicator(),
            ),
            onState: (context, state) => Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: state != null
                    ? ListView.separated(
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          User user = state[index];
                          return Slidable(
                              child: listTileCustom(user.name, user.level,
                                  user.respondeuNivelAtual),
                              actionExtentRatio: 0.25,
                              actionPane: SlidableDrawerActionPane(),
                              actions: [
                                IconSlideAction(
                                    caption: 'Repetir',
                                    color: Colors.red[200],
                                    icon: Icons.wrong_location,
                                    onTap: user.respondeuNivelAtual
                                        ? () {
                                            controller.liberarNivelUser(index);
                                          }
                                        : () {}),
                                user.level == 15
                                    ? IconSlideAction(
                                        caption: 'Nível Máximo',
                                        color: Colors.grey,
                                        icon: Icons.check,
                                        onTap: () {})
                                    : IconSlideAction(
                                        caption: 'Passar de nível',
                                        color: Colors.green[400],
                                        icon: Icons.check,
                                        onTap: () {
                                          controller.nextLevel(index);
                                        }),
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
                      )
                    : Center(
                        child: Text("Pesquise o usuário que desejar"),
                      )),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/admin/users/user');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget listTileCustom(String name, int level, bool respondeuNivel) {
  return ListTile(
    title: Text(name),
    leading: Icon(
      Icons.arrow_forward,
      color: Colors.white,
    ),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Nível $level'),
        respondeuNivel
            ? Text(
                'Nível Respondido',
                style: TextStyle(color: Colors.green),
              )
            : Text('Nível Liberado')
      ],
    ),
  );
}
