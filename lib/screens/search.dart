import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/search_bloc.dart';
import 'package:rhealth/global/constants.dart';

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
        child: Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 11,
                child: Container(
                    child: FormBuilderTextField(
                      onSubmitted: (String value) => _searchBloc.submitSearch(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 14.0
                    ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(6.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      isCollapsed: true,
                      hintText: 'Search by Pincode'),
                  name: 'search_query',
                  keyboardType:TextInputType.number,
                  validator: FormBuilderValidators.required(context),
                ))),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 10,
              child: Container(
                margin: EdgeInsets.only(top: 6.0),
                child: FormBuilderDropdown(
                  name: 'filter',
                  initialValue: 'oxygen',
                  decoration: InputDecoration(
                    isCollapsed: true,
                    icon: Container(
                        decoration: BoxDecoration(
                            color: blueModerate,
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
              ),
            ),
          ],
        )),
      ),
    );
  }
}
