import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/services/covid_api_service.dart';
import 'package:rhealth/ui/message_modal.dart';

class DonateBloc {
  final formKey = GlobalKey<FormBuilderState>();
  BuildContext context;
  String positiveDate = "";
  CovidApiService _covidApiService = CovidApiService();

  void updatePositiveWhen(String val) {
    positiveDate = val;
  }

  Future<void> submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var postObj = {
        "name": formKey.currentState.fields['donor_name'].value,
        "contact": formKey.currentState.fields['contact_number'].value,
        "other_contact":
            formKey.currentState.fields['other_means_of_contact'].value,
        "pin_code": int.parse(formKey.currentState.fields['pincode'].value),
        "address": formKey.currentState.fields['address'].value,
        "verification": formKey.currentState.fields['verification'].value,
        "resource": [
          {
            "resource_type": "plasma",
            "cost": null,
            "capacity": "",
            "description": formKey.currentState.fields['description'].value
          }
        ],
        "plasmaDonor": [
          {
            "bloodGroup": formKey.currentState.fields['blood_group'].value,
            "testedPositive":
                formKey.currentState.fields['tested_positive'].value == 'Yes'
                    ? true
                    : false,
            "positiveWhen": positiveDate == "" ? null : positiveDate,
            "vaccinated":
                formKey.currentState.fields['is_vaccinated'].value == 'Yes'
                    ? true
                    : false,
          }
        ]
      };
      await _covidApiService.postPlasmaDonationLead(postObj);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageModal(
              text:
                  'Thankyou so much for your help. These are tough times and we hope that the situation improves soon. Stay safe!',
              imgSrc: 'assets/images/thankss.png',
            );
          });
    }
  }

  Future<void> submitAndAddAnother() async {
    await submit();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MessageModal(
            text:
                'Thankyou so much for your help. These are tough times and we hope that the situation improves soon. Stay safe!',
            imgSrc: 'assets/images/thankss.png',
          );
        });
    formKey.currentState.reset();
  }
}
