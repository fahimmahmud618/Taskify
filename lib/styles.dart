import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double get_scale_factor(BuildContext context){
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth / 375.0;
}

TextStyle headingStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;

  return TextStyle(
    color: Colors.white,
    fontSize: 25 * scaleFactor,
  );
}

TextStyle logoTextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;

  return TextStyle(
    color: Colors.white,
    fontSize: 20 * scaleFactor,
  );
}

TextStyle normalTextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0; // Adjust the reference screen width as needed

  return TextStyle(
    fontSize: 15 * scaleFactor, // Adjust the base font size as needed
    // Add other text style properties as needed
  );
}

TextStyle hintTextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0; // Adjust the reference screen width as needed

  return TextStyle(
    color: Colors.white.withOpacity(0.6),
    fontSize: 13 * scaleFactor, // Adjust the base font size as needed
    // Add other text style properties as needed
  );
}

BoxDecoration bgDecor (){
  return BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      // colors: [Colors.blue, Colors.purple],
      colors: [Colors.teal.shade900, Colors.black],
    )
  );
}

BoxDecoration tileDecor (){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.teal.shade900.withOpacity(0.5), Colors.black.withOpacity(0.5)],
    )
  );
}
