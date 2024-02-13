import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';

Widget InputTextWidget(String heading, String hintText, TextEditingController textEditingController, bool isHide, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(20*get_scale_factor(context), 20*get_scale_factor(context), 20*get_scale_factor(context), 20*get_scale_factor(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: normalTextStyle(context)),
        TextField(
          obscureText: isHide,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintTextStyle(context),
          ),
        ),
      ],
    ),
  );
}