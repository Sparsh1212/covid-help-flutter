import 'package:flutter/material.dart';
import 'package:rhealth/screens/user_details.dart';
import 'package:rhealth/screens/user_leads.dart';
import 'package:rhealth/screens/user_plasma_donations.dart';
import 'package:rhealth/screens/user_requests.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetails(),
              SizedBox(
                height: 15,
              ),
              Text('My Requests', style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 15,
              ),
              UserRequests(),
              SizedBox(
                height: 15.0,
              ),
              Text('Shared leads', style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 15,
              ),
              UserLeads(),
              SizedBox(
                height: 15.0,
              ),
              Text('Plasma Donation', style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 15.0,
              ),
              UserPlasmaDonations(),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[400]),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('View all active requests and leads of my area'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
