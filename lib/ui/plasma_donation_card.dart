import 'package:flutter/material.dart';
import 'package:rhealth/global/global_functions.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/share_modal.dart';

class UserPlasmaDonationsCard extends StatelessWidget {
  final Lead lead;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;
  final VoidCallback onWithdraw;
  UserPlasmaDonationsCard(
      {@required this.lead,
      @required this.onUpvote,
      @required this.onDownvote,
      @required this.onWithdraw});
  final CovidApiService _covidApiService = CovidApiService();

  void shareLead(BuildContext context) async {
    try {
      String imgSrc =
          await _covidApiService.fetchLeadTemplateLink(lead.id.toString());
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
                    lead.title,
                    style: TextStyle(fontSize: 18.0, color: Colors.blue[900]),
                  )),
                  InkWell(
                      onTap: () => shareLead(context),
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
              Text('Specification mentioned:',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[800])),
              SizedBox(
                height: 15.0,
              ),
              lead.resourceType != 'plasma'
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cost: ' + lead.nonPlasmaDescription.cost),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Capacity: ' +
                              lead.nonPlasmaDescription.capacity),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Description: ' +
                              lead.nonPlasmaDescription.description)
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Text('Blood Group: ' +
                              lead.plasmaDescription.bloodGroup),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Tested Positive: ' +
                              lead.plasmaDescription.testedPositive.toString()),
                          lead.plasmaDescription.testedPositive
                              ? Text('Positive date: ' +
                                  lead.plasmaDescription.positiveWhen)
                              : Container(),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Vaccinated: ' +
                              lead.plasmaDescription.vaccinated.toString())
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
              SizedBox(
                height: 20.0,
              ),
              Text(lead.address,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700])),
              SizedBox(
                height: 10.0,
              ),
              Text('Contact: ' + lead.contact,
                  style: TextStyle(fontSize: 15.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(lead.verifiedBy,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[800])),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () => onUpvote(),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green[300],
                      )),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    lead.upvoteCount.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  InkWell(
                      onTap: () => onDownvote(),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.pink[300],
                      )),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    lead.downvoteCount.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              Divider(),
              InkWell(
                onTap: () => onWithdraw(),
                child: Text('Withdraw',
                    style: TextStyle(fontSize: 15.0, color: Colors.red[300])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
