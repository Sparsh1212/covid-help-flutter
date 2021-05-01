import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/screens/search_results_screen.dart';

class SearchBloc {
  final formKey = GlobalKey<FormBuilderState>();
  BuildContext context;

  void submitSearch() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      //print(formKey.currentState.value);
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => SearchResults()));
    }
  }
}
