import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';

Widget InputTextWidget(String heading, TextEditingController textEditingController, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.fromLTRB(20*scaleFactor, 10*scaleFactor, 20*scaleFactor, 10*scaleFactor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: normalTextStyle(context)),
        TextField(
          controller: textEditingController,
        ),
      ],
    ),
  );
}