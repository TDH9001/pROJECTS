import 'package:audioplayers/audioplayers.dart';
import 'package:database_sqllite/widgets/numberswid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tokuNumbers extends StatefulWidget {
  tokuNumbers({super.key});
  List<String> numb = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten"
  ];
  List<String> jap = [
    "ichi",
    "ni",
    "san",
    "shi",
    "go",
    "roku",
    "sebun",
    "hachi",
    "acto",
    "tzehn"
  ];
  @override
  State<tokuNumbers> createState() => _tokuNumbersState();
}

class _tokuNumbersState extends State<tokuNumbers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("number screen and how to learn them"),
          backgroundColor: Colors.brown,
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.numb.length,
          itemBuilder: (context, index) {
            return numWidget(
                number: widget.numb[index], jap: widget.jap[index]);
          },
        ),
      ),
    );
  }
}
