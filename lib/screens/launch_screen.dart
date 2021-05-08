import 'package:flutter/material.dart';
import 'package:rhealth/bloc/launch_bloc.dart';
import 'package:rhealth/global/constants.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  LaunchBloc launchBloc;

  @override
  void initState() {
    launchBloc = LaunchBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueLight,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 180.0),
          width: 320.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.0,
                  child: Image.asset('assets/images/icon.png')),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'R-Care',
                  style: TextStyle(color: greyDark, fontSize: 24.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Request emergency covid related help and find verified leads from R-community',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: greyLight,
                  ),
                ),
                SizedBox(
                  height: 200.0,
                ),
                Text(
                  'We stand together.',
                  style: TextStyle(color: greyDark, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
