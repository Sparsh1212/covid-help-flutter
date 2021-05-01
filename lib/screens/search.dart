import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/search_bloc.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchBloc _searchBloc = SearchBloc();

  @override
  void initState() {
    _searchBloc.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilder(
        key: _searchBloc.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
                name: 'search_query',
                decoration: InputDecoration(
                    hintText: 'Search', suffixIcon: Icon(Icons.search)),
                onSubmitted: (String query) => _searchBloc.submitSearch(),
                validator: FormBuilderValidators.required(context),
                keyboardType: TextInputType.number,),
            FormBuilderDropdown(
              name: 'filter',
              initialValue: 'Injection',
              hint: Text('Select filter'),
              items: [
                DropdownMenuItem(
                  value: 'Injection',
                  child: Text('Injection'),
                ),
                DropdownMenuItem(
                  value: 'Oxygen',
                  child: Text('Oxygen'),
                ),
                DropdownMenuItem(
                  value: 'Plasma',
                  child: Text('Plasma'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
