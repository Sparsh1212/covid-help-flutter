import 'dart:async';

import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/models/search_results_model.dart';
import 'package:rhealth/models/votes_model.dart';
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

  void sortLeadsByUpvotes() {
    leadsList.sort((b, a) => a.upvoteCount.compareTo(b.upvoteCount));
    _leadsSink.add(leadsList);
  }

  void sortLeadsByDate() {
    leadsList.sort((b, a) => a.id.compareTo(b.id));
    _leadsSink.add(leadsList);
  }

  void upVote(Lead lead) async {
    int index = leadsList.indexOf(lead);
    int id = lead.id;
    var postObj = {"lead": id, "vote": "upvote"};
    Votes votes = await _covidApiService.postVotes(postObj);
    leadsList[index].upvoteCount = votes.upvotes;
    leadsList[index].downvoteCount = votes.downvotes;
    _leadsSink.add(leadsList);
  }

  void downVote(Lead lead) async {
    int index = leadsList.indexOf(lead);
    int id = lead.id;
    var postObj = {"lead": id, "vote": "downvote"};
    Votes votes = await _covidApiService.postVotes(postObj);
    leadsList[index].upvoteCount = votes.upvotes;
    leadsList[index].downvoteCount = votes.downvotes;
    _leadsSink.add(leadsList);
  }

  void sort(String value) {
    if (value == 'latest') {
      sortLeadsByDate();
    } else {
      sortLeadsByUpvotes();
    }
  }

  void dispose() {
    _leadsController.close();
    _requestsController.close();
  }
}
