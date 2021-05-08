import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rhealth/global/global_functions.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/votes_model.dart';
import 'package:rhealth/services/covid_api_service.dart';

class UserPlasmaDonationsBloc {
  List<Lead> userPlasmaDonations;
  CovidApiService _covidApiService = CovidApiService();
  BuildContext context;

  final _userPlasmaDonationsController = StreamController<List<Lead>>();
  StreamSink<List<Lead>> get _userPlasmaDonationsSink =>
      _userPlasmaDonationsController.sink;
  Stream<List<Lead>> get userPlasmaDonationsStream =>
      _userPlasmaDonationsController.stream;

  Future<void> getUserPlasmaDonations() async {
    List<Lead> fetchedUserPlasmaDonations =
        await _covidApiService.fetchUserPlasmaDonations();
    userPlasmaDonations = fetchedUserPlasmaDonations;
    _userPlasmaDonationsSink.add(userPlasmaDonations);
  }

  void withdrawDonation(Lead lead) async {
    try {
      await _covidApiService.deleteUserPlasmaDonation(lead.id.toString());
      userPlasmaDonations.removeAt(userPlasmaDonations.indexOf(lead));
      _userPlasmaDonationsSink.add(userPlasmaDonations);
    } catch (e) {
      showError(e.message.toString(), context);
    }
  }

    void upVote(Lead lead) async {
    int index = userPlasmaDonations.indexOf(lead);
    int id = lead.id;
    try {
      var postObj = {"lead": id, "vote": "upvote"};
      Votes votes = await _covidApiService.postVotes(postObj);
      userPlasmaDonations[index].upvoteCount = votes.upvotes;
      userPlasmaDonations[index].downvoteCount = votes.downvotes;
      _userPlasmaDonationsSink.add(userPlasmaDonations);
    } catch (e) {
      showError(e.message.toString(), context);
    }
  }

  void downVote(Lead lead) async {
    int index = userPlasmaDonations.indexOf(lead);
    int id = lead.id;
    try {
      var postObj = {"lead": id, "vote": "downvote"};
      Votes votes = await _covidApiService.postVotes(postObj);
      userPlasmaDonations[index].upvoteCount = votes.upvotes;
      userPlasmaDonations[index].downvoteCount = votes.downvotes;
      _userPlasmaDonationsSink.add(userPlasmaDonations);
    } catch (e) {
      showError(e.message.toString(), context);
    }
  }

  void dispose() {
    _userPlasmaDonationsController.close();
  }
}
