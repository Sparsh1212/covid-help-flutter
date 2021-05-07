import 'dart:async';

import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/services/covid_api_service.dart';


class UserPlasmaDonationsBloc {
  List<Lead> userPlasmaDonations;
  CovidApiService _covidApiService = CovidApiService();

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

  Future<void> withdrawDonation(Lead lead) async {
    await _covidApiService.deleteUserPlasmaDonation(lead.id.toString());
    userPlasmaDonations.removeAt(userPlasmaDonations.indexOf(lead));
    _userPlasmaDonationsSink.add(userPlasmaDonations);
  }

  void dispose() {
    _userPlasmaDonationsController.close();
  }
}
