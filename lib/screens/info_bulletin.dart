import 'package:flutter/material.dart';

class InfoBulletin extends StatefulWidget {
  @override
  _InfoBulletinState createState() => _InfoBulletinState();
}

class _InfoBulletinState extends State<InfoBulletin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Information Bulletin',
              style: TextStyle(color: Colors.blue[700], fontSize: 20.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid CT values',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text('Lorem Ipsum is simply dummy text of the'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid CT values',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text('Lorem Ipsum is simply dummy text of the'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid CT values',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text('Lorem Ipsum is simply dummy text of the'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
