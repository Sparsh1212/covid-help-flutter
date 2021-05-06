import 'dart:async';

import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/services/covid_api_service.dart';

class UserLeadsBloc {
  List<Lead> userLeads;
  CovidApiService _covidApiService = CovidApiService();

  final _userLeadsController = StreamController<List<Lead>>();
  StreamSink<List<Lead>> get _userLeadsSink => _userLeadsController.sink;
  Stream<List<Lead>> get userLeadsStream => _userLeadsController.stream;

  Future<void> getUserLeads() async {
    List<Lead> fetchedUserLeads = await _covidApiService.fetchUserLeads();
    userLeads = fetchedUserLeads;
    _userLeadsSink.add(userLeads);
  }

  void dispose() {
    _userLeadsController.close();
  }
}
