import 'package:flutter/material.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/ui/tag_container.dart';

class UserRequestCard extends StatelessWidget {
  final Request request;
  UserRequestCard({@required this.request});

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
                    request.title,
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
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: request.resourcesRequired
                    .map((resourceObj) => Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Text(resourceObj.resourceType +
                              ': ' +
                              resourceObj.resourceValue),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For: ' + request.patientName,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                  ),
                  Text('Age: ' + request.patientAge,
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[800]))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CT value: ' + request.patientCtValue,
                      style:
                          TextStyle(fontSize: 15.0, color: Colors.grey[800])),
                  Text('SPO2 value: ' + request.patientSpo2Value,
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[800]))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(request.address,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700])),
              SizedBox(
                height: 10.0,
              ),
              Text('Contact: ' + request.contact,
                  style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tag(
                    color: Colors.blue[200],
                    text: request.status,
                  )
                ],
              ),
              Divider(),
              Text('Update status:  ', style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Tag(text: 'Fulfilled', color: Colors.blue[300]),
                  SizedBox(
                    width: 5.0,
                  ),
                  Tag(
                    text: 'Not needed any more',
                    color: Colors.pink[200],
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