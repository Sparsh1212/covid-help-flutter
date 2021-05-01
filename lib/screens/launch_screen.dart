import 'package:flutter/material.dart';
import 'package:rhealth/bloc/launch_bloc.dart';

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
      body: Center(
        child: Text('Rhealth'),
      ),
    );
  }
}
