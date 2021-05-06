import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSingleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                height: 15.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 300.0,
                height: 15.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250.0,
                height: 15.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 300.0,
                height: 15.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 200.0,
                height: 15.0,
                color: Colors.white,
              )
            ],
          ),
        ),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200]);
  }
}

class ShimmerCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerSingleCard(),
        ShimmerSingleCard(),
        ShimmerSingleCard()
      ],
    );
  }
}

class ShimmerInfoBulletinsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          ShimmerSingleInfoBulletin(),
          ShimmerSingleInfoBulletin(),
          ShimmerSingleInfoBulletin()
        ],
      ),
    );
  }
}

class ShimmerSingleInfoBulletin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Container(
        margin: EdgeInsets.only(bottom: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Container(
                  width: 200.0,
                  height: 15.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 300.0,
                  height: 15.0,
                  color: Colors.white,
                ),
          ],
        ),
      ),
    );
  }
}

class ShimmerProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child: Container(
      decoration: BoxDecoration(
              color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      margin: EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      height: 160.0,

    ), baseColor: Colors.grey[300], highlightColor: Colors.grey[200]);
  }
}


