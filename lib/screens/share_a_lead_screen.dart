import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/share_bloc.dart';

class ShareALead extends StatefulWidget {
  @override
  _ShareALeadState createState() => _ShareALeadState();
}

class _ShareALeadState extends State<ShareALead> {
  ShareBloc _shareBloc = ShareBloc();

  @override
  void initState() {
    _shareBloc.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Share a lead',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FormBuilder(
        key: _shareBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Cost'),
                  name: 'cost',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  decoration: InputDecoration(hintText: 'Location'),
                  name: 'location',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  decoration: InputDecoration(hintText: 'Address/Hospital'),
                  name: 'address_hospital',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Contact Number'),
                  name: 'contact_number',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  decoration:
                      InputDecoration(hintText: 'Any other means of contact'),
                  name: 'other_means_of_contact'),
              TextButton(onPressed: _shareBloc.submit, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
