import 'package:flutter/material.dart';

class news extends StatelessWidget {
  const news({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "News",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Text(
                    "Cloud",
                    style: TextStyle(color: Colors.yellowAccent),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: 120,
                color: Colors.pink,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 70,
                          height: 60,
                          color: Colors.yellow,
                        ),
                      );
                    })),
            Container(
              width: double.infinity,
              height: 606,
              color: Colors.green,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        width: 70,
                        height: 200,
                        color: Colors.black,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
