// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:gym/component/button_one.dart';
// import 'package:gym/component/button_two.dart';
// import 'package:gym/component/dialogue_box.dart';
// import 'package:gym/pages/new.dart';

// class MyHome extends StatefulWidget {
//   const MyHome({
//     super.key,
//   });

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   final workoutController = TextEditingController();

//   void Savenext() {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => NewPage(
//                   headtxt: workoutController,
//                 )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showDialog(
//             context: context,
//             builder: (context) => DialogBox(
//                 press: () => Savenext(), actualtxt: workoutController)),
//         backgroundColor: Colors.black,
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       body: SafeArea(
//           child: Container(
//         //  height: 350,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
//           child: Column(
//             children: [
//               ButtonOne(
//                 title: 'UPPER BODY',
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ButtonOne(
//                 title: 'LOWER BODY',
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
