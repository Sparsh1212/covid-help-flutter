import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rhealth/models/token_model.dart';
import 'package:rhealth/services/urls.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final _storage = new FlutterSecureStorage();

  Future<RefreshToken> fetchRefreshTokenFromApi(dynamic loginCredObj) async {
    try {
      final http.Response postResponse = await http.post(
          BASE_URL + EP_REFRESH_TOKEN,
          headers: {CONTENT_TYPE_KEY: CONTENT_TYPE},
          body: jsonEncode(loginCredObj));
      if (postResponse.statusCode == 200) {
        return RefreshToken.fromJSON(jsonDecode(postResponse.body));
      } else {
        throw Exception('Login Failed');
      }
    } catch (e) {
      throw Exception('Login Failed');
    }
  }

  Future<AccessToken> fetchAccessTokenFromRefreshTokenApi() async {
    RefreshToken refreshToken = await fetchRefreshTokenFromStorage();

    var refreshObj = {"refresh": refreshToken.refreshToken};
    final http.Response postResponse = await http.post(
        BASE_URL + EP_ACCESS_TOKEN,
        headers: {CONTENT_TYPE_KEY: CONTENT_TYPE},
        body: jsonEncode(refreshObj));

    if (postResponse.statusCode == 200) {
      return AccessToken.fromJSON(jsonDecode(postResponse.body));
    } else {
      throw Exception('Unable to fetch Access Token');
    }
  }

  Future storeRefreshToken(RefreshToken refreshToken) async {
    await _storage.write(key: "refresh_token", value: refreshToken.refreshToken);
  }

  Future storeAccessToken(AccessToken accessToken) async {
    await _storage.write(key: "access_token", value: accessToken.accessToken);
  }

  Future<RefreshToken> fetchRefreshTokenFromStorage() async {
    String refreshToken = await _storage.read(key: "refresh_token");
    return RefreshToken(refreshToken: refreshToken);
  }

  Future<AccessToken> fetchAccessTokenFromStorage() async {
    String accessToken = await _storage.read(key: "access_token");
    return AccessToken(accessToken: accessToken);
  }

  Future initAuthSession() async {
    AccessToken accessToken = await fetchAccessTokenFromRefreshTokenApi();
    await storeAccessToken(accessToken);
  }

  Future clearStorage() async {
    await _storage.deleteAll();
  }
}
