import 'dart:convert';
import 'package:rhealth/models/info_bulletin.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/models/search_results_model.dart';
import 'package:rhealth/models/token_model.dart';
import 'package:rhealth/models/user_model.dart';
import 'package:rhealth/models/votes_model.dart';
import 'package:rhealth/services/auth_service.dart';
import 'package:rhealth/services/urls.dart';
import 'package:http/http.dart' as http;

class CovidApiService {
  AuthService _authService = AuthService();

  Future<String> getAcessToken() async {
    AccessToken accessToken = await _authService.fetchAccessTokenFromStorage();
    return accessToken.accessToken;
  }

  Future<UserAcademicData> fetchUserAcademicData() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(BASE_URL + EP_WHO_AM_I,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200)
      return UserAcademicData.fromJSON(jsonDecode(response.body));
    else
      throw Exception('Error fetching user academic details');
  }

  Future<UserLocalData> fetchUserLocalData() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_USER_LOCAL_DATA,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});
    if (response.statusCode == 200)
      return UserLocalData.fromJSON(jsonDecode(response.body));
    else
      throw Exception('Error fetching user local data');
  }

  Future<UserFullData> fetchUserFullData() async {
    UserAcademicData userAcademicData = await fetchUserAcademicData();
    UserLocalData userLocalData = await fetchUserLocalData();
    return UserFullData.fromJSON(userAcademicData, userLocalData);
  }

  Future<List<Lead>> fetchUserLeads() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_USER_LEADS,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map<Lead>((leadObj) => Lead.fromJSON(leadObj)).toList();
    } else
      throw Exception('Error fetching user leads');
  }

  Future<List<Lead>> fetchUserPlasmaDonations() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_USER_PLASMA_DONATIONS,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map<Lead>((leadObj) => Lead.fromJSON(leadObj)).toList();
    } else
      throw Exception('Error fetching user plasma donations');
  }

  Future<List<Request>> fetchUserRequests() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_USER_REQUESTS,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list
          .map<Request>((requestObj) => Request.fromJSON(requestObj))
          .toList();
    } else
      throw Exception('Error fetching user leads');
  }

  Future<SearchResults> fetchSearchResults(String searchQuery) async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_SEARCH + searchQuery,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      return SearchResults.fromJSON(jsonDecode(response.body));
    } else
      throw Exception('Error fetching search results');
  }

  Future<List<Bulletin>> fetchInfoBulletins() async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + EP_INFO_BULLETINS,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list
          .map<Bulletin>((bulletinObj) => Bulletin.fromJSON(bulletinObj))
          .toList();
    } else
      throw Exception('Error fetching info bulletins');
  }

  Future<String> fetchLeadTemplateLink(String id) async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + 'lead-template?id=' + id,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['templateLink'];
    } else {
      throw Exception('Error fetching lead template');
    }
  }

  Future<String> fetchRequestTemplateLink(String id) async {
    String accessToken = await getAcessToken();

    final http.Response response = await http.get(
        BASE_URL + COVID_API_BASE + 'request-template?id=' + id,
        headers: {AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken});

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['templateLink'];
    } else {
      throw Exception('Error fetching request template');
    }
  }

  Future<void> postLead(var obj) async {
    String accessToken = await getAcessToken();

    final http.Response response =
        await http.post(BASE_URL + COVID_API_BASE + EP_POST_LEAD,
            headers: {
              AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
              CONTENT_TYPE_KEY: CONTENT_TYPE
            },
            body: jsonEncode(obj));
  }

  Future<void> postPlasmaDonationLead(var obj) async {
    String accessToken = await getAcessToken();

    final http.Response response =
        await http.post(BASE_URL + COVID_API_BASE + EP_POST_LEAD,
            headers: {
              AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
              CONTENT_TYPE_KEY: CONTENT_TYPE
            },
            body: jsonEncode(obj));
    print(response.statusCode);
    print(response.body);
  }

  Future<void> postRequest(var obj) async {
    String accessToken = await getAcessToken();

    final http.Response response =
        await http.post(BASE_URL + COVID_API_BASE + EP_POST_REQUEST,
            headers: {
              AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
              CONTENT_TYPE_KEY: CONTENT_TYPE
            },
            body: jsonEncode(obj));
  }

  Future<void> deleteUserPlasmaDonation(String id) async {
    String accessToken = await getAcessToken();

    final http.Response response = await http
        .delete(BASE_URL + COVID_API_BASE + EP_POST_LEAD + id + '/', headers: {
      AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
    });
  }

  Future<Votes> postVotes(var obj) async {
    String accessToken = await getAcessToken();

    final http.Response response =
        await http.post(BASE_URL + COVID_API_BASE + EP_POST_VOTE,
            headers: {
              AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
              CONTENT_TYPE_KEY: CONTENT_TYPE
            },
            body: jsonEncode(obj));
    if (response.statusCode == 200) {
      return Votes.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Error voting');
    }
  }

  Future<void> patchStatus(String id, var obj) async {
    String accessToken = await getAcessToken();

    final http.Response response =
        await http.patch(BASE_URL + COVID_API_BASE + EP_POST_REQUEST + id + '/',
            headers: {
              AUTHORIZAION_KEY: AUTHORIZATION_PREFIX + accessToken,
              CONTENT_TYPE_KEY: CONTENT_TYPE
            },
            body: jsonEncode(obj));
  }
}
