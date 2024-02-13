import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';

// Widget MyAlert(String text, BuildContext context){
//   return Container(
//     child: showAlertDialog(context),
//   );
// }

showAlertDialog(String title, String description, BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.teal.shade900,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskifyNameplate(context),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(title, style: TextStyle(
            color: Colors.white,
            fontSize: 27 * get_scale_factor(context),
          ),),
        ),
      ],
    ),
    content: Text(description, style: normalTextStyle(context),),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}