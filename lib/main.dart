import 'package:flutter/material.dart';
import 'package:gym/data/workout_data.dart';
import 'package:gym/pages/home.dart';
import 'package:gym/pages/origin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => WorkoutData())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OriginalPage(),
      ),
    );
  }
}
