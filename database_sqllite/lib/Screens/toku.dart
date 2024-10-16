import 'package:database_sqllite/Screens/toku_numbers.dart';
import 'package:database_sqllite/widgets/text_container.dart';
import 'package:flutter/material.dart';

class tokuApp extends StatelessWidget {
  const tokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "toku app",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [
            TextCotnainer(
              taped: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tokuNumbers(),
                    ));
              },
              col: Colors.orange,
              text: "numbers",
            ),
            TextCotnainer(
              col: Colors.green,
              text: "family memenrs",
            ),
            TextCotnainer(
              col: Colors.purple,
              text: "Colors",
            ),
            TextCotnainer(
              col: Colors.cyan,
              text: "phrases",
            ),
          ],
        ),
      ),
    );
  }
}
