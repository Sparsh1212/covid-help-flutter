import 'package:flutter/material.dart';
import 'package:rhealth/screens/launch_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
      ),
      home: Launch(),
    );
  }
}
