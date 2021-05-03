import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/ui/plasma_donation_card.dart';

class UserPlasmaDonations extends StatefulWidget {
  @override
  _UserPlasmaDonationsState createState() => _UserPlasmaDonationsState();
}

class _UserPlasmaDonationsState extends State<UserPlasmaDonations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: [SingleChildScrollView(child: PlasmaDonationCard())],
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0,
            autoPlay: true,
          )),
    );
  }
}
