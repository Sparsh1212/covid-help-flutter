import 'package:flutter/material.dart';
import 'package:rhealth/global/constants.dart';
import 'package:rhealth/models/user_model.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/shimmers.dart';

class UserDetails extends StatelessWidget {
  final CovidApiService _covidApiService = CovidApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<UserFullData>(
          future: _covidApiService.fetchUserFullData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserFullData user = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(color: blueDark, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    user.degree,
                    style: TextStyle(fontSize: 18.0, color: greyDark),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    user.currentYear,
                    style: TextStyle(fontSize: 18.0, color: greyDark),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Contact Number: ' + user.contactNumber,
                    style: t16,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Address: ' + user.address,
                    style: t16,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'If you wish to edit these details for the mail services, please contact IMG.',
                    style: TextStyle(color: blueModerate, fontSize: 16.0),
                  )
                ],
              );
            }

            return ShimmerProfileCard();
          }),
    );
  }
}
