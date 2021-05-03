import 'package:flutter/material.dart';
import 'package:rhealth/screens/info_bulletin.dart';
import 'package:rhealth/screens/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(),
          SizedBox(height: 20.0,),
          Expanded(child: InfoBulletin())
        ],
      ),
    );
  }
}