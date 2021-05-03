import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rhealth/bloc/share_bloc.dart';
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
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _shareBloc.selectRequirements,
                child: Text('Select leads'),
              ),
              SizedBox(
                height: 15.0,
              ),
              StreamBuilder<List<bool>>(
                  initialData: _shareBloc.metaTags,
                  stream: _shareBloc.metaTagStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: snapshot.data
                          .asMap()
                          .entries
                          .map((entry) => entry.value
                              ? _shareBloc
                                  .getAllRequirements(context)[entry.key]
                              : Container())
                          .toList(),
                    );
                  }),
              themeFormTextField('cost', 'Cost', context, true),
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
                onPressed: _shareBloc.submit,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
