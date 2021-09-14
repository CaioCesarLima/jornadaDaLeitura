import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:jornada_da_leitura/app/modules/admin/level/level_triple_store.dart';

class LevelPage extends StatefulWidget {
  final Level level;
  const LevelPage({Key key, this.level}) : super(key: key);

  @override
  LevelPageState createState() => LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  TextEditingController videoYoutube = TextEditingController();
  TextEditingController trecho = TextEditingController();
  TextEditingController urlFormulario = TextEditingController();
  final controller = Modular.get<LevelTripleStore>();

  @override
  void initState() {
    super.initState();
    videoYoutube.text = widget.level.videoYoutube;
    trecho.text = widget.level.trecho;
    urlFormulario.text = widget.level.urlFormulario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nível ${widget.level.level}'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('Trecho: '),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: trecho,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          //label: Text('Senha'),
                          labelText: 'Trecho',
                          
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
                ),
                //Text('${widget.level.videoYoutube}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('Video do Youtube: '),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: videoYoutube,
                      decoration: InputDecoration(
                          //label: Text('Senha'),
                          labelText: 'Vídeo Youtube',
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
                ),
                //Text('${widget.level.videoYoutube}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('Url do Formulário: '),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: urlFormulario,
                      decoration: InputDecoration(
                          //label: Text('Senha'),
                          labelText: 'Vídeo Youtube',
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
                ),

                //Text('${widget.level.videoYoutube}'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              controller.salvarLevel(trecho.text, videoYoutube.text, urlFormulario.text, widget.level.id, widget.level.level);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Salvar Alterações',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
