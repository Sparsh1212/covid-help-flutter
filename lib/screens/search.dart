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
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                height: 25.0,
                child: FormBuilderTextField(
                  name: 'search_query',
                  decoration: InputDecoration(
                      isCollapsed: true,
                      hintText: 'Enter your pin code',
                      prefixIcon: Icon(Icons.search)),
                  onSubmitted: (String query) => _searchBloc.submitSearch(),
                  validator: FormBuilderValidators.required(context),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
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
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              flex: 5,
              child: FormBuilderDropdown(
                name: 'filter',
                initialValue: 'oxygen',
                decoration: InputDecoration(
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
