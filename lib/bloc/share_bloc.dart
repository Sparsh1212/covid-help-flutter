import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/global/global_functions.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/message_modal.dart';

class ShareBloc {
  final formKey = GlobalKey<FormBuilderState>();
  BuildContext context;
  CovidApiService _covidApiService = CovidApiService();

  void submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(formKey.currentState.value);
      var postObj = {
        "name": formKey.currentState.fields['name'].value,
        "contact": formKey.currentState.fields['contact_number'].value,
        "other_contact":
            formKey.currentState.fields['other_means_of_contact'].value,
        "pin_code": int.parse(formKey.currentState.fields['pincode'].value),
        "address": formKey.currentState.fields['address'].value,
        "verification": formKey.currentState.fields['verification'].value,
        "resource": [
          {
            "resource_type": formKey.currentState.fields['resource_type'].value,
            "cost": formKey.currentState.fields['cost'].value,
            "capacity": formKey.currentState.fields['capacity'].value,
            "description": formKey.currentState.fields['description'].value
          }
        ],
        "plasmaDonor": []
      };
      try {
        await _covidApiService.postLead(postObj);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageModal(
                text:
                    'Thankyou so much for your help. These are tough times and we hope that the situation improves soon. Stay safe!',
                imgSrc: 'assets/images/thankss.png',
              );
            });
      } catch (e) {
        showError(e.message.toString(), context);
      }
    }
  }
}
