import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  Tag({this.text, this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
