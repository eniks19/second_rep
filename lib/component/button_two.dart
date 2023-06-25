import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonTwo extends StatelessWidget {
  ButtonTwo({super.key, required this.txt});
  String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
