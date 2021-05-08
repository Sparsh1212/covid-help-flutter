import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/bloc/user_plasma_donations_bloc.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/ui/plasma_donation_card.dart';
import 'package:rhealth/ui/shimmers.dart';

class UserPlasmaDonations extends StatefulWidget {
  @override
  _UserPlasmaDonationsState createState() => _UserPlasmaDonationsState();
}

class _UserPlasmaDonationsState extends State<UserPlasmaDonations> {
  UserPlasmaDonationsBloc _userPlasmaDonationsBloc = UserPlasmaDonationsBloc();

  @override
  void initState() {
    _userPlasmaDonationsBloc.context = context;
    _userPlasmaDonationsBloc.getUserPlasmaDonations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Lead>>(
          stream: _userPlasmaDonationsBloc.userPlasmaDonationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text('You have not done any donations yet'),
                );
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 330.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                ),
                items: snapshot.data
                    .map((leadObj) => Scrollbar(
                      child: SingleChildScrollView(
                              child: UserPlasmaDonationsCard(
                            lead: leadObj,
                            onUpvote: () =>
                                _userPlasmaDonationsBloc.upVote(leadObj),
                            onDownvote: () =>
                                _userPlasmaDonationsBloc.downVote(leadObj),
                            onWithdraw: () => _userPlasmaDonationsBloc
                                .withdrawDonation(leadObj),
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
