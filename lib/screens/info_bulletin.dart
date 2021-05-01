import 'package:flutter/material.dart';

class InfoBulletin extends StatefulWidget {
  @override
  _InfoBulletinState createState() => _InfoBulletinState();
}

class _InfoBulletinState extends State<InfoBulletin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Information Bulletin', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(),
          Text('Random heading 1'),
          SizedBox(),
          Text('Random heading 1')
        ],
      ),
    );
  }
}