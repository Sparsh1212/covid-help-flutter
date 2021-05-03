import 'package:flutter/material.dart';
import 'package:rhealth/ui/tag_container.dart';

class RequestCard extends StatelessWidget {
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
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.blue[300]),
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
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('For: Patient Name', style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800]),), Text('Age: 57', style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800]))],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('RT value: 445', style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800])), Text('SPO2 value: 90', style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800]))],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('1234, Sector-67, Gurugram, Haryana 122001',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700])),
              SizedBox(
                height: 10.0,
              ),
              Text('Contact Details', style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tag(
                    color: Colors.blue[200],
                    text: 'Active',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
