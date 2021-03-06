import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rhealth/global/global_functions.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/services/covid_api_service.dart';

class UserRequestsBloc {
  BuildContext context;
  List<Request> userRequests;
  CovidApiService _covidApiService = CovidApiService();

  final _userRequestsController = StreamController<List<Request>>();
  StreamSink<List<Request>> get _userRequestsSink =>
      _userRequestsController.sink;
  Stream<List<Request>> get userRequestsStream =>
      _userRequestsController.stream;

  Future<void> getUserRequests() async {
    List<Request> fetchedUserRequests =
        await _covidApiService.fetchUserRequests();
    userRequests = fetchedUserRequests;
    _userRequestsSink.add(userRequests);
  }

  String getStatusFromKey(String key) {
    if (key == 'active')
      return 'Active';
    else if (key == 'fulfilled')
      return 'Fulfilled';
    else
      return 'Not Required Anymore';
  }

  void updateStatus(int index, String status) async {
    var patchObj = {"status": status};
    try {
      await _covidApiService.patchStatus(
          userRequests[index].id.toString(), patchObj);
      userRequests[index].status = getStatusFromKey(status);
      _userRequestsSink.add(userRequests);
    } catch (e) {
      showError(e.message.toString(), context);
    }
  }

  void dispose() {
    _userRequestsController.close();
  }
}
