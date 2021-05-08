import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/enum/enums.dart';
import 'package:rhealth/models/token_model.dart';
import 'package:rhealth/screens/app_screen.dart';
import 'package:rhealth/services/auth_service.dart';

class LoginBloc {
  BuildContext context;
  final formKey = GlobalKey<FormBuilderState>();

  final _progressController = StreamController<LoginState>();
  StreamSink<LoginState> get _progressSink => _progressController.sink;
  Stream<LoginState> get progressStream => _progressController.stream;

  AuthService _authService = AuthService();

  void disposeStreams() {
    _progressController.close();
  }

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _progressSink.add(LoginState.inProgress);
      try {
        _progressSink.add(LoginState.inProgress);
        var loginCredObj = {
          "username": formKey.currentState.fields['username'].value,
          "password": formKey.currentState.fields['password'].value
        };
        RefreshToken refreshToken =
            await _authService.fetchRefreshTokenFromApi(loginCredObj);
        await _authService.storeRefreshToken(refreshToken);
        await _authService.initAuthSession();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => App()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid credentials"),
        ));
        _progressSink.add(LoginState.initLogin);
      }
    }
  }
}
