import 'package:flutter/material.dart';
import 'package:rhealth/global/constants.dart';
import 'package:rhealth/models/user_model.dart';
import 'package:rhealth/screens/search_results_screen.dart';
import 'package:rhealth/screens/user_details.dart';
import 'package:rhealth/screens/user_leads.dart';
import 'package:rhealth/screens/user_plasma_donations.dart';
import 'package:rhealth/screens/user_requests.dart';
import 'package:rhealth/services/covid_api_service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> openAllLeadsAndRequestsOfUserLocation() async {
    CovidApiService covidApiService = CovidApiService();
    UserLocalData userLocalData = await covidApiService.fetchUserLocalData();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => SearchResults(
                  searchQuery: userLocalData.pincode.toString(),
                  searchFilter: 'all',
                )));
  }

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
                height: 25,
              ),
              Text('My Requests', style: t20),
              SizedBox(
                height: 15,
              ),
              UserRequests(),
              SizedBox(
                height: 15.0,
              ),
              Text('Shared leads', style: t20),
              SizedBox(
                height: 15,
              ),
              UserLeads(),
              SizedBox(
                height: 15.0,
              ),
              Text('Plasma Donation', style: t20),
              SizedBox(
                height: 15.0,
              ),
              UserPlasmaDonations(),
              SizedBox(height: 15.0,),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(blueModerate),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: openAllLeadsAndRequestsOfUserLocation,
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
