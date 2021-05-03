import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget themeFormTextField(String fieldName, String fieldHint, BuildContext context, bool isNumeric) {
  return Container(
    margin: EdgeInsets.only(bottom: 15.0),
    child: FormBuilderTextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          isCollapsed: true,
          hintText: fieldHint),
      name: fieldName,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.name ,
      validator: FormBuilderValidators.required(context),
    ),
  );
}

Widget themeSuffixFormTextField(String fieldName, String fieldLabel, String fieldHint, BuildContext context, bool isNumeric) {
  return Row(
    children: [
      Text(fieldLabel+':', style: TextStyle(fontSize: 15.0),),
      SizedBox(width: 10.0,),
      Container(
        width: 100.0,
        margin: EdgeInsets.only(bottom: 15.0),
        child: FormBuilderTextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              isCollapsed: true,
              suffixText: fieldHint),
          name: fieldName,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.name ,
          validator: FormBuilderValidators.required(context),
        ),
      ),
    ],
  );
}
