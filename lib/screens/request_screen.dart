import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/request_bloc.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  RequestBloc _requestBloc = RequestBloc();

  @override
  void initState() {
    _requestBloc.context = context;
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
          'Request emergency help',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FormBuilder(
        key: _requestBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                decoration: InputDecoration(hintText: 'Patient Name'),
                name: 'patient_name',
                validator: FormBuilderValidators.required(context),
              ),
              FormBuilderTextField(
                  decoration:
                      InputDecoration(hintText: 'Patient Aadhar Card Number'),
                  name: 'patient_aadhar_card',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Age'),
                  name: 'age',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  decoration: InputDecoration(hintText: 'Patient CT value'),
                  name: 'patient_ct_value',
                  validator: FormBuilderValidators.required(context)),
              FormBuilderTextField(
                  decoration: InputDecoration(hintText: 'Patient SPO2 level'),
                  name: 'patient_spo2_level',
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
              TextButton(onPressed: _requestBloc.submit, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
