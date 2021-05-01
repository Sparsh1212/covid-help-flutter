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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(),
          Expanded(child: InfoBulletin())
        ],
      ),
    );
  }
}