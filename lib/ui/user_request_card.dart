import 'package:flutter/material.dart';
import 'package:rhealth/global/constants.dart';
import 'package:rhealth/global/global_functions.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/share_modal.dart';
import 'package:rhealth/ui/tag_container.dart';

class UserRequestCard extends StatelessWidget {
  final Request request;
  final Function(String) onStatusChanged;
  UserRequestCard({@required this.request, @required this.onStatusChanged});
  final CovidApiService _covidApiService = CovidApiService();

  void shareRequest(BuildContext context) async {
    try {
      String imgSrc = await _covidApiService
          .fetchRequestTemplateLink(request.id.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ShareModal(
              imgSrc: imgSrc,
            );
          });
    } catch (e) {
      showError(e.message.toString(), context);
    }
  }

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
                    style: TextStyle(fontSize: 18.0, color: blueDark),
                  )),
                  InkWell(
                      onTap: () => shareRequest(context),
                      child: Row(children: [
                        Icon(
                          Icons.share,
                          color: blueModerate,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 18.0, color: blueModerate),
                        )
                      ]))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Specification mentioned',
                  style: TextStyle(fontSize: 15.0, color: greyLight)),
              SizedBox(
                height: 5.0,
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
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For: ' + request.patientName,
                    style: TextStyle(fontSize: 15.0, color: greyDark),
                  ),
                  Text('Age: ' + request.patientAge,
                      style: TextStyle(fontSize: 15.0, color: greyDark))
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CT value: ' + request.patientCtValue,
                      style:
                          TextStyle(fontSize: 15.0, color: greyDark)),
                  Text('SPO2 value: ' + request.patientSpo2Value,
                      style: TextStyle(fontSize: 15.0, color: greyDark))
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(request.address,
                  style: TextStyle(fontSize: 15.0, color: greyLight)),
              SizedBox(
                height: 5.0,
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
                    color: blueModerate,
                    text: request.status,
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 5.0,),
              Text('Update status:  ', style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              updateStatusWidgets()
            ],
          ),
        ),
      ),
    );
  }

  Row updateStatusWidgets() {
    if (request.status == 'Active') {
      return Row(
        children: [
          InkWell(
              onTap: () => onStatusChanged('fulfilled'),
              child: Tag(text: 'Fulfilled', color: Colors.green[100])),
          SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () => onStatusChanged('not_required_anymore'),
            child: Tag(
              text: 'Not Required Anymore',
              color: Colors.pink[100],
            ),
          )
        ],
      );
    } else if (request.status == 'Fulfilled') {
      return Row(
        children: [
          InkWell(
              onTap: () => onStatusChanged('active'),
              child: Tag(text: 'Active', color: Colors.green[100])),
          SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () => onStatusChanged('not_required_anymore'),
            child: Tag(
              text: 'Not Required Anymore',
              color: Colors.pink[100],
            ),
          )
        ],
      );
    } else {
      return Row(
        children: [
          InkWell(
              onTap: () => onStatusChanged('active'),
              child: Tag(text: 'Active', color: Colors.green[100])),
          SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () => onStatusChanged('fulfilled'),
            child: Tag(
              text: 'Fulfilled',
              color: Colors.pink[100],
            ),
          )
        ],
      );
    }
  }
}
