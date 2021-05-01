import 'package:flutter/material.dart';
import 'package:rhealth/bloc/app_bloc.dart';
import 'package:rhealth/screens/home_screen.dart';
import 'package:rhealth/screens/plasma_donate_screen.dart';
import 'package:rhealth/screens/request_screen.dart';
import 'package:rhealth/screens/share_a_lead_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppBloc _appBloc = AppBloc();
  final List<Widget> _children = [Home(), Request(), ShareALead(), PlasmaDonate()];

  @override
  void initState() {
    _appBloc.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _appBloc.indexStream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('R-health'),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: _appBloc.openProfile,
                child: Icon(Icons.person_rounded))
            ],
          ),
          body:  IndexedStack(
            index: snapshot.data,
            children: _children,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              onTap: _appBloc.onTabTapped,
              currentIndex: snapshot.data, // new// new
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_quote, color: Colors.black),
                  label: 'Request',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.share_outlined, color: Colors.black),
                    label: 'Share a lead'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.donut_large, color: Colors.black),
                    label: 'Donate'),
              ]),
        );
      }
    );
  }
}
