import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/bloc/user_leads_bloc.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/ui/lead_card.dart';
import 'package:rhealth/ui/shimmers.dart';

class UserLeads extends StatefulWidget {
  @override
  _UserLeadsState createState() => _UserLeadsState();
}

class _UserLeadsState extends State<UserLeads> {
  UserLeadsBloc _userLeadsBloc = UserLeadsBloc();

  @override
  void initState() {
    _userLeadsBloc.context = context;
    _userLeadsBloc.getUserLeads();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Lead>>(
          stream: _userLeadsBloc.userLeadsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text('You have not shared any leads yet'),
                );
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 320.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                ),
                items: snapshot.data
                    .map((leadObj) => Scrollbar(
                      child: SingleChildScrollView(
                              child: LeadCard(
                            lead: leadObj,
                            onUpvote: () => _userLeadsBloc.upVote(leadObj),
                            onDownvote: () => _userLeadsBloc.downVote(leadObj),
                          )),
                    ))
                    .toList(),
              );
            }
            return ShimmerSingleCard();
          }),
    );
  }
}
