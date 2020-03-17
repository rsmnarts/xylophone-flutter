import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Column createChildrenButton() {
    List<String> list = [
      'e6261f',
      'eb7532',
      'f7d038',
      'a3e048',
      '49da9a',
      '34bbe6',
      '4355db'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: list
          .asMap()
          .map(
            (i, v) => MapEntry(
              i,
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note$i.wav');
                  },
                  color: HexColor(v),
                  child: null,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: createChildrenButton(),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
