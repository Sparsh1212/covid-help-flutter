import 'package:flutter/material.dart';
import 'package:rhealth/services/urls.dart';
import 'package:share/share.dart';

class ShareModal extends StatelessWidget {
  ShareModal({this.imgSrc});

  final String imgSrc;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(bottom: 100.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.clear))
              ],
            ),
            Container(
              child: Image.network(BASE_URL + imgSrc),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => Share.share(BASE_URL + imgSrc),
                child: Text('Share')),
          ],
        ),
      ),
    );
  }
}
