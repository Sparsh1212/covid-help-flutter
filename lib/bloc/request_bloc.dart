import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/styles/form_field_styles.dart';
import 'package:rhealth/ui/message_modal.dart';

class RequestBloc {
  final formKey = GlobalKey<FormBuilderState>();
  final requirementsFormKey = GlobalKey<FormBuilderState>();
  BuildContext context;
  List<bool> metaTags = [false, false, false, false, false, false, false];
  CovidApiService _covidApiService = CovidApiService();

  List<Widget> getAllRequirements(BuildContext screenContext) {
    return [
      themeFormTextField('oxygen', 'Oxygen Req.', context, false),
      themeFormTextField('plasma', 'Plasma Req.', context, false),
      themeFormTextField('remdesivir_tocilizumab',
          'Remdesivir & Tocilizumab Req.', context, false),
      themeFormTextField(
          'fabiflu_favipiravir', 'Fabiflu & Favipiravir Req.', context, false),
      themeFormTextField('hospital_beds', 'Hospital beds Req.', context, false),
      themeFormTextField(
          'icu_and_ventilator', 'ICU & Ventilator Req.', context, false),
      themeFormTextField('other', 'Other Req.', context, false)
    ];
  }

  dynamic getResourceObj(int i) {
    switch (i) {
      case 0:
        return {
          "resourceType": "oxygen",
          "requirement": formKey.currentState.fields['oxygen'].value,
          "patientBloodGroup": null
        };
      case 1:
        return {
          "resourceType": "plasma",
          "requirement": "",
          "patientBloodGroup": formKey.currentState.fields['plasma'].value
        };
      case 2:
        return {
          "resourceType": "remdesivir_tocilizumab",
          "requirement":
              formKey.currentState.fields['remdesivir_tocilizumab'].value,
          "patientBloodGroup": null
        };
      case 3:
        return {
          "resourceType": "fabiflu_favipiravir",
          "requirement":
              formKey.currentState.fields['fabiflu_favipiravir'].value,
          "patientBloodGroup": null
        };
      case 4:
        return {
          "resourceType": "hospital_beds",
          "requirement": formKey.currentState.fields['hospital_beds'].value,
          "patientBloodGroup": null
        };
      case 5:
        return {
          "resourceType": "icu_and_ventilator",
          "requirement":
              formKey.currentState.fields['icu_and_ventilator'].value,
          "patientBloodGroup": null
        };
      case 6:
        return {
          "resourceType": "other",
          "requirement": formKey.currentState.fields['other'].value,
          "patientBloodGroup": null
        };
    }
  }

  List<dynamic> constructResources() {
    List<dynamic> list = [];
    for (int i = 0; i < metaTags.length; i++) {
      if (metaTags[i]) {
        list.add(getResourceObj(i));
      }
    }

    return list;
  }

  final _metaTagsController = StreamController<List<bool>>();
  StreamSink<List<bool>> get _metaTagsSink => _metaTagsController.sink;
  Stream<List<bool>> get metaTagStream => _metaTagsController.stream;

  void submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var postObj = {
        "patient_name": formKey.currentState.fields['patient_name'].value,
        "age": int.parse(formKey.currentState.fields['age'].value),
        "contact": formKey.currentState.fields['contact_number'].value,
        "other_contact":
            formKey.currentState.fields['other_means_of_contact'].value,
        "pin_code": int.parse(formKey.currentState.fields['pincode'].value),
        "address": formKey.currentState.fields['address'].value,
        "patient_spo2": formKey.currentState.fields['patient_spo2_level'].value,
        "patient_ct_value":
            int.parse(formKey.currentState.fields['patient_ct_value'].value),
        "resource": constructResources()
      };
      await _covidApiService.postRequest(postObj);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageModal(
              text:
                  'Don’t worry, as your request has been shared with our network. These are tough times and we pray that everything gets well soon. Take care!',
              imgSrc: 'assets/images/hope.png',
            );
          });
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
                      title: Text('Oxygen')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '1',
                      title: Text('Plasma')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '2',
                      title: Text('Remdesivir & Tocilizumab')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '3',
                      title: Text('Fabiflu & Favipiravir')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '4',
                      title: Text('Hospital beds')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '5',
                      title: Text('ICU & Ventilator')),
                  FormBuilderCheckbox(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
                      initialValue: false,
                      name: '6',
                      title: Text('Other')),
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
