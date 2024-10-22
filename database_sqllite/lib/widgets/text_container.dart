import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextCotnainer extends StatelessWidget {
  TextCotnainer({super.key, required this.col, required this.text, this.taped});
  Color? col;
  String? text;
  Function()? taped;
  void def() {
    print("null");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (taped != null) {
          taped!();
        } else {
          def();
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        color: col,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$text",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
