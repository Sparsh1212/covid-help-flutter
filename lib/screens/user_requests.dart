import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/bloc/user_requests_bloc.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/ui/shimmers.dart';
import 'package:rhealth/ui/user_request_card.dart';

class UserRequests extends StatefulWidget {
  @override
  _UserRequestsState createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  UserRequestsBloc _userRequestsBloc = UserRequestsBloc();

  @override
  void initState() {
    _userRequestsBloc.context = context;
    _userRequestsBloc.getUserRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Request>>(
          stream: _userRequestsBloc.userRequestsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text('You have not made any requests yet.'),
                );
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 370.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                ),
                items: snapshot.data
                    .map((requestObj) => SingleChildScrollView(
                            child: UserRequestCard(
                          request: requestObj,
                          onStatusChanged: (String updatedStatus) =>
                              _userRequestsBloc.updateStatus(
                                  snapshot.data.indexOf(requestObj),
                                  updatedStatus),
                        )))
                    .toList(),
              );
            }
            return ShimmerSingleCard();
          }),
    );
  }
}
