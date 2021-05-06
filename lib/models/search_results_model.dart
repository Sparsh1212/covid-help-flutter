import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/request_model.dart';

class SearchResults {
  final List<Lead> leadsList;
  final List<Request> requestsList;

  SearchResults({this.leadsList, this.requestsList});

  static List<Lead> constructLeadsList(dynamic json){
    return json.map<Lead>((leadObj) => Lead.fromJSON(leadObj)).toList();
  }


  static List<Request> constructRequestsList(dynamic json){
    return json.map<Request>((requestObj) => Request.fromJSON(requestObj)).toList();
  }

  factory SearchResults.fromJSON(dynamic json) {
    return SearchResults(
      leadsList: constructLeadsList(json['leads']),
      requestsList: constructRequestsList(json['requests']) 
    );
  }
}
