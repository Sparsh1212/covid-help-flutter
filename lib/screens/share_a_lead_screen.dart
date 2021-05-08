import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/share_bloc.dart';
import 'package:rhealth/global/constants.dart';
import 'package:rhealth/styles/form_field_styles.dart';

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
      body: FormBuilder(
        key: _shareBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.0),
              Text(
                'Share a lead',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              themeFormTextField('name', 'Name', context, false),
              FormBuilderDropdown(
                name: 'resource_type',
                initialValue: 'oxygen',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(6.0),
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'oxygen',
                    child: Text('Oxygen'),
                  ),
                  DropdownMenuItem(
                    value: 'remdesivir_tocilizumab',
                    child: Text('Remdesivir & Tocilizumab'),
                  ),
                  DropdownMenuItem(
                    value: 'fabiflu_favipiravir',
                    child: Text('Fabiflu & Favipiravir'),
                  ),
                  DropdownMenuItem(
                    value: 'hospital_beds',
                    child: Text('Hospital beds'),
                  ),
                  DropdownMenuItem(
                    value: 'icu_and_ventilator',
                    child: Text('ICU & Ventilator'),
                  ),
                  DropdownMenuItem(
                    value: 'other',
                    child: Text('Other'),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              themeFormTextField('cost', 'Cost', context, true),
              themeFormTextField('capacity', 'Capacity', context, false),
              themeFormTextField('description', 'Description', context, false),
              themeFormTextField('pincode', 'Pincode', context, true),
              themeFormTextField('address', 'Address', context, false),
              themeFormTextField(
                  'contact_number', 'Contact Number', context, true),
              themeFormTextField('other_means_of_contact',
                  'Any other means of contact', context, false),
              FormBuilderDropdown(
                name: 'verification',
                initialValue: 'verified_by_me',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(6.0),
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'verified_by_me',
                    child: Text('Verified By Me'),
                  ),
                  DropdownMenuItem(
                    value: 'verified_by_someone_else',
                    child: Text('Verified By Someone Else'),
                  ),
                  DropdownMenuItem(
                    value: 'not_verified',
                    child: Text('Not Verified'),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(blueModerate),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _shareBloc.submit,
                child: Text('Submit', style: t18,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
