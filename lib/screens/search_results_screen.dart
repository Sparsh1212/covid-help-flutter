import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/ui/lead_card.dart';
import 'package:rhealth/ui/request_card.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
          'Search Results',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 25.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Gurgaon',
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.blue[400],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Leads',
                  ),
                  Tab(
                    text: 'Requests',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 140.0,
                  child: FormBuilder(
                      child: FormBuilderDropdown(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.swap_vert,
                          color: Colors.black,
                        )),
                    name: 'filter',
                    initialValue: 'latest',
                    items: [
                      DropdownMenuItem(
                        value: 'latest',
                        child: Text('Latest'),
                      ),
                      DropdownMenuItem(
                        value: 'upvotes',
                        child: Text('Upvotes'),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      //LeadCard(),
                    ],
                  ),
                ),

                // second tab bar view widget
                SingleChildScrollView(
                  child: Column(
                    children: [
                      RequestCard(),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
