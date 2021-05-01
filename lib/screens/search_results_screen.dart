import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
    void initState() {
      _tabController = TabController(length: 2, vsync: this);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Column(
        children: [
          Row(
            children: [Text('Location')],
          ),
          SizedBox(
            height: 15.0,
          ),
         Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Leads',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Requests',
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 15.0,
          ),
          FormBuilder(
              child: FormBuilderDropdown(
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
          SizedBox(
            height: 15.0,
          ),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                    child: Text(
                      'Leads',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            ],
          ))
        ],
      ),
    );
  }
}
