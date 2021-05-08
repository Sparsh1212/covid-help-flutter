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
  final List<Widget> _children = [
    Home(),
    Request(),
    ShareALead(),
    PlasmaDonate()
  ];

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
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 50.0,
              title: Text(
                'R-Care',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap: _appBloc.openProfile,
                    child: Icon(Icons.person_rounded,
                        color: Colors.black, size: 30.0)),
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: IndexedStack(
                index: snapshot.data,
                children: _children,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                onTap: _appBloc.onTabTapped,
                currentIndex: snapshot.data, // new// new
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.post_add_outlined),
                    label: 'Request',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.share_outlined), label: 'Share a lead'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.control_point_outlined)
                      ,label: 'Donate'),
                ]),
          );
        });
  }
}
