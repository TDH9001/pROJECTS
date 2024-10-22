import 'package:database_sqllite/Screens/news.dart';
import 'package:database_sqllite/models/articleModels.dart';
import 'package:database_sqllite/services/newsservice.dart';
import 'package:database_sqllite/sql/sqldb.dart';
import 'package:database_sqllite/Screens/toku.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(firstPage());
}

class firstPage extends StatefulWidget {
  sqldb sq = sqldb();

  firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(198, 255, 255, 0),
        body: Row(
          children: [
            Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Container(
                  width: 120,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () async {
                    int respo = await widget.sq.insertData(
                        "INSERT INTO 'NOTES'('note') values ('first')");
                    print(respo);
                  },
                  color: Colors.red,
                  child: Text("insert"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      List<Map> data =
                          await widget.sq.readData("SELECT * FROM 'NOTES'  ");
                      print(data);
                      for (int i = 0; i < data.length; i++) {
                        print("${data[i]['id']} , ${data[i]['note']}");
                      }
                    },
                    child: const Text("display")),
                MaterialButton(
                  onPressed: () async {
                    int respo = await widget.sq
                        .deleteData("delete from NOTES where id = ?", ['1']);
                    print(respo);
                  },
                  color: Colors.red,
                  child: Text("DELETE"),
                ),
                MaterialButton(
                  onPressed: () async {
                    int respo = await widget.sq.updateData(
                        "update  NOTES set note = ? where id = ?",
                        ['DEMACIAAAAAAA', '4']);
                    print(respo);
                  },
                  color: Colors.blue,
                  child: Text("UPDATE"),
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const tokuApp(),
                            ));
                      },
                      child: const Text("navigate to toku"));
                }),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => news(),
                            ));
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      child: const Text("navigate to News "));
                })
              ],
            ),
            Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Container(
                  width: 120,
                )
              ],
            )
          ],
        ),
        appBar: AppBar(
          title: const Text(
            "the notes app",
            style: TextStyle(color: Colors.black, fontSize: 32),
          ),
          backgroundColor: const Color.fromARGB(198, 255, 255, 0),
        ),
      ),
    ));
  }
}
