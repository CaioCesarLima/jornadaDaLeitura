import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://forms.gle/6JAsoVcJKukhDt9H6';

class LevelPage extends StatefulWidget {
  final String title;
  final int levelID;
  const LevelPage({
    Key key,
    this.title = "Desafio",
    this.levelID,
  }) : super(key: key);
  @override
  LevelPageState createState() => LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'W-rHIsDFrzQ',
    params: YoutubePlayerParams(
      
      // Defining custom playlist
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Nível ${widget.levelID}',
              style:
                  GoogleFonts.pacifico(fontSize: 25, color: Colors.purple[100]),
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
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Trecho para Leitura',
              style:
                  GoogleFonts.pacifico(fontSize: 25, color: Colors.purple[100]),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '''De repente, não mais que de repente
Fez-se de triste o que se fez amante
E de sozinho o que se fez contente.''',
              style:
                  GoogleFonts.openSans(fontSize: 16, color: Colors.purple[100]),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Link para Formulário',
              style:
                  GoogleFonts.pacifico(fontSize: 25, color: Colors.purple[100]),
            ),
            
          ),
          
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 20),
          child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)
                    ),
                      onPressed: () {
                        _launchURL();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Responder Quiz'),
                      )),
        )
      ]),
    );
  }
}
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
