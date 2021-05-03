import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/screens/user_request_card.dart';

class UserRequests extends StatefulWidget {
  @override
  _UserRequestsState createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: [
            SingleChildScrollView(child: UserRequestCard()),
            SingleChildScrollView(child: UserRequestCard())
          ],
          options: CarouselOptions(
            height: 340.0,
            viewportFraction: 1.0,
            autoPlay: true,
          )),
    );
  }
}
