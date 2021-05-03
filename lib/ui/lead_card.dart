import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    'Remdisivir',
                    style: TextStyle(fontSize: 18.0, color: Colors.blue[900]),
                  )),
                  InkWell(
                      onTap: () {},
                      child: Row(children: [
                        Icon(
                          Icons.share,
                          color: Colors.blue[300],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Share',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.blue[300]),
                        )
                      ]))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Specification mentioned',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[800])),
              SizedBox(
                height: 10.0,
              ),
              Text('1234, Sector-67, Gurugram, Haryana 122001',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700])),
              SizedBox(
                height: 10.0,
              ),
              Text('Cost: Rs 199',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[500])),
              SizedBox(
                height: 15.0,
              ),
              Text('Contact Details', style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              Text('Verified by',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[800])),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green[300],
                      )),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '7',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.pink[300],
                      )),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    '3',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
