import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';

Widget TaskifyNameplate(BuildContext context){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.task, size: 25*get_scale_factor(context), color: Colors.lightGreenAccent,),
        Text("Taskify", style: logoTextStyle(context),),
      ],
    ),
  );
}