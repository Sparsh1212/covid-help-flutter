import 'package:flutter/material.dart';
import 'package:rhealth/models/request_model.dart';
import 'package:rhealth/ui/request_card.dart';
import 'package:rhealth/ui/shimmers.dart';

class RequestTabBar extends StatefulWidget {
  final Stream requestsStream;
  RequestTabBar({@required this.requestsStream});
  @override
  _RequestTabBarState createState() => _RequestTabBarState();
}

class _RequestTabBarState extends State<RequestTabBar>
    with AutomaticKeepAliveClientMixin<RequestTabBar> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Request>>(
        stream: widget.requestsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0)
              return Center(
                child: Text('No matching requests'),
              );
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: RequestCard(request: snapshot.data[index]));
              },
            );
          }
          return SingleChildScrollView(child: ShimmerCardsList());
        });
  }
}
