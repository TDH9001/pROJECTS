import 'package:database_sqllite/sql/sqldb.dart';
import 'package:database_sqllite/Screens/toku.dart';
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
        backgroundColor: Color.fromARGB(198, 255, 255, 0),
        body: Row(
          children: [
            Column(
              children: [
                Spacer(
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
                  child: Text("insert"),
                  color: Colors.red,
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
                    child: Text("display")),
                MaterialButton(
                  onPressed: () async {
                    int respo = await widget.sq
                        .deleteData("delete from NOTES where id = ?", ['1']);
                    print(respo);
                  },
                  child: Text("DELETE"),
                  color: Colors.red,
                ),
                MaterialButton(
                  onPressed: () async {
                    int respo = await widget.sq.updateData(
                        "update  NOTES set note = ? where id = ?",
                        ['DEMACIAAAAAAA', '4']);
                    print(respo);
                  },
                  child: Text("UPDATE"),
                  color: Colors.blue,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tokuApp(),
                            ));
                      },
                      child: const Text("navigate to toku"));
                })
              ],
            ),
            Column(
              children: [
                Spacer(
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
