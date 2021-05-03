import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/request_bloc.dart';
import 'package:rhealth/styles/form_field_styles.dart';

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
      body: FormBuilder(
        key: _requestBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.0),
              Text(
                'Request emergency help',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
             TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _requestBloc.selectRequirements,
                child: Text('Add Requirements'),
              ),
              SizedBox(height: 10.0,),
              StreamBuilder<List<bool>>(
                  initialData: _requestBloc.metaTags,
                  stream: _requestBloc.metaTagStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: snapshot.data
                          .asMap()
                          .entries
                          .map((entry) => entry.value
                              ? _requestBloc.getAllRequirements(context)[entry.key]
                              : Container())
                          .toList(),
                    );
                  }),
              themeFormTextField(
                  'patient_name', 'Patient Name', context, false),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: themeFormTextField('patient_aadhar_card',
                        'Patient Aadhar Card Number', context, false),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      flex: 2,
                      child: themeFormTextField('age', 'Age', context, true))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: themeFormTextField(
                        'patient_ct_value', 'Patient CT value', context, false),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: themeFormTextField('patient_spo2_level',
                          'Patient SPO2 level', context, true))
                ],
              ),
              themeFormTextField('location', 'Location', context, false),
              themeFormTextField(
                  'address_hospital', 'Address/Hospital', context, false),
              themeFormTextField(
                  'contact_number', 'Contact Number', context, true),
              themeFormTextField('other_means_of_contact',
                  'Any other means of contact', context, false),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _requestBloc.submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
