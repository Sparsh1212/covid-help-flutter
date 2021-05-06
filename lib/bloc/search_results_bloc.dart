import 'dart:async';

import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/models/search_results_model.dart';
import 'package:rhealth/services/covid_api_service.dart';

class SearchResultsBloc {
  List<Lead> leadsList;
  List<Request> requestsList;

  CovidApiService _covidApiService = CovidApiService();

  final _leadsController = StreamController<List<Lead>>();
  StreamSink<List<Lead>> get _leadsSink => _leadsController.sink;
  Stream<List<Lead>> get leadsStream => _leadsController.stream;

  final _requestsController = StreamController<List<Request>>();
  StreamSink<List<Request>> get _requestsSink => _requestsController.sink;
  Stream<List<Request>> get requestsStream => _requestsController.stream;

  Future getSearchResults(String searchQuery, String searchFilter) async {
    if (searchFilter != 'all') {
      SearchResults searchResults = await _covidApiService
          .fetchSearchResults('p=' + searchQuery + '&r=' + searchFilter);
      leadsList = searchResults.leadsList;
      requestsList = searchResults.requestsList;
    } else {
      SearchResults searchResults =
          await _covidApiService.fetchSearchResults('p=' + searchQuery);
      leadsList = searchResults.leadsList;
      requestsList = searchResults.requestsList;
    }
    _leadsSink.add(leadsList);
    _requestsSink.add(requestsList);
  }

  void dispose() {
    _leadsController.close();
    _requestsController.close();
  }
}
