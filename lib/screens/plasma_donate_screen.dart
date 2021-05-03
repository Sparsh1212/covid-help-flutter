import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/donate_bloc.dart';
import 'package:rhealth/styles/form_field_styles.dart';
import 'package:date_time_picker/date_time_picker.dart';

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
      body: FormBuilder(
        key: _donateBloc.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.0),
              Text(
                'Donate plasma',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text('Blood Group:   '),
                  Container(
                    width: 80.0,
                    child: FormBuilderDropdown(
                name: 'blood_group',
                initialValue: 'o+',
                decoration: InputDecoration(
                  filled: true,
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(8.0)
                ),
                items: [
                    DropdownMenuItem(
                      value: 'o+',
                      child: Text('O+'),
                    ),
                    DropdownMenuItem(
                      value: 'o-',
                      child: Text('O-'),
                    ),
                    DropdownMenuItem(
                      value: 'a+',
                      child: Text('A+'),
                    )
                ],
              ),
                  )
                ],
              ),
              SizedBox(height: 15.0,),
              Text('Have you ever been tested positive?'),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderRadioGroup(
                      decoration: InputDecoration(
                          isCollapsed: true, border: InputBorder.none),
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
                      child: Container(
                        child: DateTimePicker(
                          decoration: InputDecoration(
                            hintText: 'Date',
                            isCollapsed: true
                          ),
                          initialValue: '',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date',
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Have you been vaccinated within 28 days?'),
              FormBuilderRadioGroup(
                decoration: InputDecoration(
                    isCollapsed: true, border: InputBorder.none),
                initialValue: 'Yes',
                name: 'is_vaccinated',
                validator: FormBuilderValidators.required(context),
                options: ['Yes', 'No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              SizedBox(
                height: 10.0,
              ),
              themeFormTextField('donor_name', 'Donor Name', context, false),
              themeFormTextField('location', 'Location', context, false),
              themeFormTextField(
                  'address_hospital', 'Address/Hospital', context, false),
              themeFormTextField(
                  'contact_number', 'Contact Number', context, true),
              themeFormTextField('other_means_of_contact',
                  'Any other means of contact', context, false),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue[200]),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: _donateBloc.submitAndAddAnother,
                        child: Text('Submit and add another member')),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: _donateBloc.submit,
                        child: Text('Submit')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
