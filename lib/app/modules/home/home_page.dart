

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jornada_da_leitura/app/models/user_model.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() { 
    super.initState();
    store.setUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ScopedBuilder<HomeStore, dynamic, User>(
        onState:(context, state)=> Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                'https://lp.mentalidadeempreendedora.com.br/wp-content/uploads/2017/06/background-preto-1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Column(
                        children: [
                          Text('Que bom que você voltou', style: GoogleFonts.pacifico(
                            fontSize: 20,
                            color: Colors.purple[100]
                          ),),
                          Text(state.name, style: GoogleFonts.pacifico(
                            fontSize: 30,
                            color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: TimelineTile(
                              beforeLineStyle: LineStyle(
                                color: state.level >= index + 1
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                              afterLineStyle: LineStyle(
                                color: state.level > index + 1
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                              alignment: TimelineAlign.manual,
                              lineXY: index % 2 == 0 ? 0 : 1,
                              isFirst: index == 0,
                              isLast: index == 14,
                              axis: TimelineAxis.horizontal,
                              indicatorStyle: IndicatorStyle(
                                  height: 80,
                                  width: 80,
                                  indicator: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        color: state.level >= index + 1
                                            ? Colors.purple
                                            : Colors.grey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Nível",
                                          style: GoogleFonts.pacifico(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '${index + 1}',
                                          style: GoogleFonts.pacifico(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: TimelineDivider(
                              color: state.level > index + 1
                                  ? Colors.purple
                                  : Colors.grey,
                              axis: TimelineAxis.vertical,
                              begin: 0.09,
                              end: 0.91,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)
                  ),
                    onPressed: () {
                      store.goToLevel();
                    },
                    child: Text('Próximo Nível'))
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}
