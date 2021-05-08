import 'package:flutter/material.dart';
import 'package:rhealth/global/constants.dart';
import 'package:rhealth/models/info_bulletin.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/shimmers.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoBulletin extends StatefulWidget {
  @override
  _InfoBulletinState createState() => _InfoBulletinState();
}

class _InfoBulletinState extends State<InfoBulletin> {
  CovidApiService _covidApiService = CovidApiService();

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Information Bulletin',
              style: TextStyle(color: blueDark, fontSize: 20.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: FutureBuilder<List<Bulletin>>(
                  future: _covidApiService.fetchInfoBulletins(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: blueLight,
                                  borderRadius: BorderRadius.circular(5.0)),
                              padding: EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(bottom: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            snapshot.data[index].title,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0,),
                                      InkWell(
                                        onTap: () => launchURL(snapshot.data[index].link),
                                        child: Icon(Icons.open_in_new_rounded, color: blueModerate,))
                                    ],
                                  ),
                                  Html(data: snapshot.data[index].description),
                                ],
                              ),
                            );
                          });
                    }
                    return ShimmerInfoBulletinsList();
                  }),
            ),
          ],
        ));
  }
}
