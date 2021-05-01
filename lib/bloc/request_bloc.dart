import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RequestBloc {
  final formKey = GlobalKey<FormBuilderState>();
  BuildContext context;

  void submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(formKey.currentState.value);
    }
  }
}
