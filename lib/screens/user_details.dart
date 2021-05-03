import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sparsh Agrawal',
            style: TextStyle(color: Colors.blue[700], fontSize: 18.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'BTech II Year',
            style: TextStyle(fontSize: 18.0, color: Colors.grey[500]),
          ),
          SizedBox(height: 20.0,),
           Text(
            'Contact Number: ',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 15.0,),
          Text(
            'Address: ',
            style: TextStyle(fontSize: 18.0),
          ),
           SizedBox(height: 15.0,),
             Text(
            'If you wish to edit these details for the mail services, please contact IMG.',
            style: TextStyle(color: Colors.blue[700], fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
