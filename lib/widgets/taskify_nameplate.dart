import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/alert.dart';

Widget TaskifyNameplate(BuildContext context){
  return Padding(
    padding: EdgeInsets.only(left: 20*get_scale_factor(context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.task, size: 25*get_scale_factor(context), color: Colors.teal.shade400,),
        Text("Taskify", style: logoTextStyle(context),),
      ],
    ),
  );
}
Widget TaskifyNameplateWithLogOut(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20*get_scale_factor(context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task, size: 25*get_scale_factor(context), color: Colors.teal.shade400,),
            Text("Taskify", style: logoTextStyle(context),),
          ],
        ),
        TextButton.icon(
          onPressed: () {
            showAlertDialog("Alert","Feilds cannot be empty!",context);
          },
          icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
          label: Text("Log out", style: normalTextStyle(context)),
        ),
    
      ],
    ),
  );
}