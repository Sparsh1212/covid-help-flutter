import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rhealth/ui/lead_card.dart';

class UserLeads extends StatefulWidget {
  @override
  _UserLeadsState createState() => _UserLeadsState();
}

class _UserLeadsState extends State<UserLeads> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250.0,
          viewportFraction: 1.0,
          autoPlay: true,
        ),
        items: [
          SingleChildScrollView(child: LeadCard()),
          SingleChildScrollView(child: LeadCard())
        ],
      ),
    );
  }
}
