import 'package:flutter/material.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/ui/lead_card.dart';
import 'package:rhealth/ui/shimmers.dart';

class LeadTabBar extends StatefulWidget {
  final Stream leadsStream;
  final Function(Lead) onUpvote;
  final Function(Lead) onDownvote;
  LeadTabBar(
      {@required this.leadsStream,
      @required this.onUpvote,
      @required this.onDownvote});
  @override
  _LeadTabBarState createState() => _LeadTabBarState();
}

class _LeadTabBarState extends State<LeadTabBar>
    with AutomaticKeepAliveClientMixin<LeadTabBar> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Lead>>(
        stream: widget.leadsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0)
              return Center(
                child: Text('No matching leads'),
              );
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: LeadCard(
                    lead: snapshot.data[index],
                    onUpvote: () => widget.onUpvote(snapshot.data[index]),
                    onDownvote: () => widget.onDownvote(snapshot.data[index]),
                  ),
                );
              },
            );
          }
          return SingleChildScrollView(child: ShimmerCardsList());
        });
  }
}
