import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/search_results_bloc.dart';
import 'package:rhealth/models/lead_model.dart';
import 'package:rhealth/screens/lead_tab_bar.dart';
import 'package:rhealth/screens/requests_tab_bar.dart';

class SearchResults extends StatefulWidget {
  final String searchQuery;
  final String searchFilter;

  SearchResults({@required this.searchQuery, this.searchFilter});

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final SearchResultsBloc _searchResultsBloc = SearchResultsBloc();

  @override
  void initState() {
    _searchResultsBloc.context = context;
    _tabController = TabController(length: 2, vsync: this);
    _searchResultsBloc.getSearchResults(
        widget.searchQuery, widget.searchFilter);
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
                  widget.searchQuery,
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
                    onChanged: (String value) => _searchResultsBloc.sort(value),
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
                LeadTabBar(
                  leadsStream: _searchResultsBloc.leadsStream,
                  onUpvote: (Lead lead) => _searchResultsBloc.upVote(lead),
                  onDownvote: (Lead lead) => _searchResultsBloc.downVote(lead),
                ),
                RequestTabBar(requestsStream: _searchResultsBloc.requestsStream)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
