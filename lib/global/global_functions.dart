import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flushbar/flushbar.dart';

SpinKitChasingDots spinner() {
  return SpinKitChasingDots(
    duration: Duration(milliseconds: 1000),
    color: Colors.blue[900],
    size: 35.0,
  );
}

void showMyFlushBar(BuildContext context, String message, bool success) {
  Flushbar(
    margin: EdgeInsets.only(top: 50.0, left: 100.0, right: 100.0),
    padding: EdgeInsets.all(10.0),
    borderRadius: 3.0,
    backgroundColor: success ? Colors.green[400] : Colors.red[400],
    boxShadows: [
      BoxShadow(color: Colors.black45, offset: Offset(3, 3), blurRadius: 3)
    ],
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    duration: Duration(seconds: 2),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ],
    ),
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);
}



