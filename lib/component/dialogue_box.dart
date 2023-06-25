import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gym/component/button_two.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.press, required this.actualtxt});
  void Function()? press;
  final actualtxt;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 100,
        //color: Colors.black,
        child: Column(
          children: [
            TextField(
              controller: actualtxt,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'New Workout'),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(onTap: press, child: ButtonTwo(txt: 'Save')),
                SizedBox(
                  width: 8,
                ),
                ButtonTwo(txt: 'Cancel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
