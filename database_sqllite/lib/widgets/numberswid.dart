import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';

// ignore: must_be_immutable
class numWidget extends StatelessWidget {
  numWidget({this.num = 1, this.number = "one", this.jap = "ichi", super.key});

  int? num;
  String? number;
  String? jap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 100,
            color: const Color(0xFF8A7F66),
            child: Image.asset("assets/images/numbers/number_$number.png"),
          ),
          Container(
            width: 150,
            height: 100,
            color: Colors.orange,
            child: Text(
              "$number \n$jap",
              style: const TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.orange,
                  fontSize: 30),
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          IconButton(
            onPressed: () async {
              final player = AudioPlayer();
              //player.setSourceAsset("sounds/numbers/number_$number.mp3");
              // await player.play(AssetSource('sounds/colors/black.wav'));
              await player.play(
                  AssetSource("sounds/numbers/number_${number}_sound.mp3"));
            },
            icon: const Icon(Icons.play_arrow),
            splashColor: Colors.green,
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
