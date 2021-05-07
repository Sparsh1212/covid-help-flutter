import 'dart:async';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/services/covid_api_service.dart';


class UserRequestsBloc {
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

  void dispose() {
    _userRequestsController.close();
  }
}
