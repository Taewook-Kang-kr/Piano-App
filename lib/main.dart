import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
  .then((_) {
    runApp(PianoApp());
  });
}

class PianoApp extends StatelessWidget {
  void playSound(String pianoKey) {
    final player = AudioCache();
    player.play('$pianoKey.wav');
  }

  Expanded buildKey({Color color, String pianoKey}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(pianoKey);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, pianoKey: "do"),
                buildKey(color: Colors.orange, pianoKey: "re"),
                buildKey(color: Colors.yellow, pianoKey: "mi"),
                buildKey(color: Colors.green, pianoKey: "fa"),
                buildKey(color: Colors.teal, pianoKey: "sol"),
                buildKey(color: Colors.blue, pianoKey: "la"),
                buildKey(color: Colors.grey, pianoKey: "ti"),
                buildKey(color: Colors.purple, pianoKey: "high_do"),
              ],
          ),
        ),
      ),
    );
  }
}
