import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/ui/message_modal.dart';

class DonateBloc {
  final formKey = GlobalKey<FormBuilderState>();
  BuildContext context;

  void submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(formKey.currentState.value);
    }
  }

  void submitAndAddAnother() {
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
    // if (formKey.currentState.validate()) {
    //   formKey.currentState.save();
    //   print(formKey.currentState.value);
    // }
  }
}
