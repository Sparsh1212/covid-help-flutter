import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/donate_bloc.dart';

class PlasmaDonate extends StatefulWidget {
  @override
  _PlasmaDonateState createState() => _PlasmaDonateState();
}

class _PlasmaDonateState extends State<PlasmaDonate> {
  DonateBloc _donateBloc = DonateBloc();

  @override
  void initState() {
    _donateBloc.context = context;
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
        key: _donateBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Have you ever been tested positive'),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderRadioGroup(
                      initialValue: 'No',
                      name: 'tested_positive',
                      validator: FormBuilderValidators.required(context),
                      options: ['Yes', 'No']
                          .map((lang) => FormBuilderFieldOption(value: lang))
                          .toList(growable: false),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Date'),
                    ),
                  )
                ],
              ),
              Text('Have you been vaccinated within 28 days?'),
              FormBuilderRadioGroup(
                initialValue: 'Yes',
                name: 'tested_positive',
                validator: FormBuilderValidators.required(context),
                options: ['Yes', 'No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              FormBuilderTextField(
                  decoration: InputDecoration(hintText: 'Donor Name'),
                  name: 'donor_name',
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
              Row(
                children: [
                  TextButton(
                      onPressed: _donateBloc.submitAndAddAnother,
                      child: Text('Submit and add another member')),
                  TextButton(onPressed: _donateBloc.submit, child: Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
