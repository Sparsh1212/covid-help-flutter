import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rhealth/screens/profile_screen.dart';

class AppBloc {
  BuildContext context;

  final _indexController = StreamController<int>();
  StreamSink<int> get _indexSink => _indexController.sink;
  Stream<int> get indexStream => _indexController.stream;

  void onTabTapped(int index) {
    _indexSink.add(index);
  }

  void openProfile() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Profile()));
  }

  void dispose() {
    _indexController.close();
  }
}
