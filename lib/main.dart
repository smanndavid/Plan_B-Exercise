import 'package:flutter/material.dart';
import 'package:plan_b_exercise/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.red[800]
      ),
    );
  }
}

