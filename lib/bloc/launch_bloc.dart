import 'package:flutter/material.dart';
import 'package:rhealth/models/token_model.dart';
import 'package:rhealth/screens/app_screen.dart';
import 'package:rhealth/screens/login_screen.dart';
import 'package:rhealth/services/auth_service.dart';

class LaunchBloc {
  BuildContext context;
  AuthService _authService = AuthService();

  LaunchBloc(BuildContext screenContext) {
    context = screenContext;
    decideFlow();
  }

  Future<bool> alreadyLoggedIn() async {
    RefreshToken refreshToken =
        await _authService.fetchRefreshTokenFromStorage();
    return refreshToken.refreshToken != null;
  }

  Future decideFlow() async {
    bool loggedIn = await alreadyLoggedIn();
    if (loggedIn) {
      await _authService.initAuthSession();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => App()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }
  }
}
