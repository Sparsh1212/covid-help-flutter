import 'dart:convert';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/models/token_model.dart';
import 'package:rhealth/models/user_model.dart';
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
      return list.map((leadObj) => Lead.fromJSON(leadObj)).toList();
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
      return list.map((leadObj) => Lead.fromJSON(leadObj)).toList();
    } else
      throw Exception('Error fetching user plasma donations');
  }
}