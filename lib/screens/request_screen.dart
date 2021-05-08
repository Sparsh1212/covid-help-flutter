import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/request_bloc.dart';
import 'package:rhealth/global/constants.dart';
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
              InkWell(
                onTap: () => _requestBloc.selectRequirements(),
                child: Row(
                  children: [
                    Text('Add Requirements', style: TextStyle(
                      color: blueDark,
                      fontSize: 18.0
                    ),), SizedBox(width: 5.0,), Icon(Icons.arrow_drop_down, color: blueDark, size: 30.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder<List<bool>>(
                  initialData: _requestBloc.metaTags,
                  stream: _requestBloc.metaTagStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: snapshot.data
                          .asMap()
                          .entries
                          .map((entry) => entry.value
                              ? _requestBloc
                                  .getAllRequirements(context)[entry.key]
                              : Container())
                          .toList(),
                    );
                  }),
              themeFormTextField(
                  'patient_name', 'Patient Name', context, false),
              themeFormTextField('age', 'Age', context, true),
              Row(
                children: [
                  Expanded(
                    child: themeFormTextField(
                        'patient_ct_value', 'Patient CT value', context, true),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: themeFormTextField('patient_spo2_level',
                          'Patient SPO2 level', context, false))
                ],
              ),
              themeFormTextField('pincode', 'Pincode', context, true),
              themeFormTextField(
                  'address', 'Address', context, false),
              themeFormTextField(
                  'contact_number', 'Contact Number', context, true),
              themeFormTextField('other_means_of_contact',
                  'Any other means of contact', context, false),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(blueModerate),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _requestBloc.submit,
                child: Text('Submit', style: t18,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
