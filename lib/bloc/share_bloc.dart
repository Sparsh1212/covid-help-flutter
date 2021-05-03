import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/styles/form_field_styles.dart';

class ShareBloc {
  final formKey = GlobalKey<FormBuilderState>();
  final requirementsFormKey = GlobalKey<FormBuilderState>();
  BuildContext context;
  List<bool> metaTags = [false, false, false];

  List<Widget> getAllRequirements(BuildContext screenContext) {
    return [
      themeSuffixFormTextField(
          'req_1', 'Remdisivir', 'in no.s', screenContext, true),
      themeSuffixFormTextField('req_2', 'Oxygen', 'in L', screenContext, false),
      themeSuffixFormTextField('req_3', 'Beds', 'in no.s', screenContext, true),
    ];
  }

  final _metaTagsController = StreamController<List<bool>>();
  StreamSink<List<bool>> get _metaTagsSink => _metaTagsController.sink;
  Stream<List<bool>> get metaTagStream => _metaTagsController.stream;

  void submit() {
    if (formKey.currentState.validate()) {
      print(metaTags);
      formKey.currentState.save();
      print(formKey.currentState.value);
    }
  }

  void selectRequirements() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0))),
        context: context,
        builder: (context) {
          return FormBuilder(
            key: requirementsFormKey,
            child: Container(
              height: 280.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: ListView(
                children: [
                  Text(
                    'Requirements',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '0',
                      title: Text('Remdisivir')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '1',
                      title: Text('Oxygen')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '2',
                      title: Text('Bed')),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue[400]),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: requirementSelectAndProceed,
                    child: Text('Select and Proceed'),
                  )
                ],
              ),
            ),
          );
        });
  }

  void requirementSelectAndProceed() {
    requirementsFormKey.currentState.save();
    for (int i = 0; i < metaTags.length; i++) {
      metaTags[i] = requirementsFormKey.currentState.fields[i.toString()].value;
    }
    _metaTagsSink.add(metaTags);
    Navigator.pop(context);
  }

  void dispose() {
    _metaTagsController.close();
  }
}
