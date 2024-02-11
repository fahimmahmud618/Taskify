import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget InputTextWidget(String heading, TextEditingController textEditingController){
  return Container(
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading),
        TextField(
          controller: textEditingController,
        ),
      ],
    ),
  );
}