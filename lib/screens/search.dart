import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/search_bloc.dart';
import 'package:rhealth/styles/form_field_styles.dart';

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
      margin: EdgeInsets.only(top: 10.0),
      child: FormBuilder(
        key: _searchBloc.formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              child: themeFormTextField('search_query',
                                  'Search by pincode', context, true))),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: SizedBox(
                            height: 34.0,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.blue[300]),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.white),
                              ),
                              onPressed: () => _searchBloc.submitSearch(),
                              child: Text('Search'),
                            ),
                          ))
                    ],
                  )),
            ),
            Container(
              width: 250,
              child: FormBuilderDropdown(
                name: 'filter',
                initialValue: 'oxygen',
                decoration: InputDecoration(
                  icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            5.0,
                          )),
                      child: Icon(
                        Icons.filter_list,
                        size: 25.0,
                        color: Colors.white,
                      )),
                  border: InputBorder.none,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'oxygen',
                    child: Text('Oxygen'),
                  ),
                  DropdownMenuItem(
                    value: 'plasma',
                    child: Text('Plasma'),
                  ),
                  DropdownMenuItem(
                    value: 'remdesivir_tocilizumab',
                    child: Text('Remdesivir & Tocilizumab'),
                  ),
                  DropdownMenuItem(
                    value: 'fabiflu_favipiravir',
                    child: Text('Fabiflu & Favipiravir'),
                  ),
                  DropdownMenuItem(
                    value: 'hospital_beds',
                    child: Text('Hospital beds'),
                  ),
                  DropdownMenuItem(
                    value: 'icu_and_ventilator',
                    child: Text('ICU & Ventilator'),
                  ),
                  DropdownMenuItem(
                    value: 'other',
                    child: Text('Other'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
