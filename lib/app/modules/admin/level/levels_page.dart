import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/modules/admin/level/levels_triple_store.dart';
import 'package:jornada_da_leitura/app/utils.dart';

class LevelsPage extends StatefulWidget {
  final String title;
  const LevelsPage({Key key, this.title = "Níveis"}) : super(key: key);
  @override
  LevelsPageState createState() => LevelsPageState();
}

class LevelsPageState extends ModularState<LevelsPage, LevelsTripleStore> {
  @override
  void initState() {
    super.initState();
    store.getLevels();
  }

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
              onPressed: () {
                Modular.to.navigate('/admin/users');
              },
              child: Text(
                'Editar Usuários',
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
          Expanded(
              child: ScopedBuilder<LevelsTripleStore, dynamic, List<Level>>(
            onLoading: (context) => Center(
              child: CircularProgressIndicator(),
            ),
            onError: (context, error) => Utils.showToast(context, error),
            onState: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: ListView.separated(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                        child: listTileCustom(state[index]),
                        actionExtentRatio: 0.25,
                        actionPane: SlidableDrawerActionPane(),
                        actions: [
                          IconSlideAction(
                              caption: 'Editar',
                              color: Colors.blue[400],
                              icon: Icons.edit,
                              onTap: () {
                                Modular.to.navigate('/admin/levels/level',
                                    arguments: state[index]);
                              }),
                        ]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

Widget listTileCustom(Level level) {
  return ListTile(
    title: Text('Nível ${level.level}'),
    leading: Icon(
      Icons.arrow_forward,
      color: Colors.white,
    ),
  );
}
