import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jornada_da_leitura/app/models/level_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

import 'level_triple_store.dart';


class LevelPage extends StatefulWidget {
  final String title;
  final Level level;
  const LevelPage({
    Key key,
    this.title = "Desafio",
    this.level,
  }) : super(key: key);
  @override
  LevelPageState createState() => LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  LevelTripleStore controller = LevelTripleStore();
  @override
  void initState() {
    super.initState();
    //  controller.getLevel();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '',
    params: YoutubePlayerParams(
      // Defining custom playlist
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    _controller.cue(widget.level.videoYoutube);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: ScopedBuilder<LevelTripleStore, dynamic, Level>(
          onLoading: (context)=>Center(
            child: CircularProgressIndicator(),
          ),
          onState: (context, state) => ListView(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Nível ${widget.level.level}',
                  style: GoogleFonts.pacifico(
                      fontSize: 25, color: Colors.purple[100]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: YoutubePlayerIFrame(
                
                controller: _controller,

                aspectRatio: 16 / 9,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Trecho para Leitura',
                  style: GoogleFonts.pacifico(
                      fontSize: 25, color: Colors.purple[100]),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
                child: Text(
                  '${widget.level.trecho}',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                      fontSize: 16, color: Colors.purple[100]),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Link para Formulário',
                  
                  style: GoogleFonts.pacifico(
                      fontSize: 25, color: Colors.purple[100]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 24, right: 24, bottom: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                  onPressed: () {
                    _launchURL(widget.level.urlFormulario);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Responder Quiz'),
                  )),
            )
          ]),
        ));
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
