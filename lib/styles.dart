import 'dart:ui';

import 'package:flutter/cupertino.dart';

double get_scale_factor(BuildContext context){
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth / 375.0;
}

TextStyle headingStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;

  return TextStyle(
    fontSize: 25 * scaleFactor,
  );
}

TextStyle logoTextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;

  return TextStyle(
    fontSize: 20 * scaleFactor,
  );
}

TextStyle normalTextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0; // Adjust the reference screen width as needed

  return TextStyle(
    fontSize: 12 * scaleFactor, // Adjust the base font size as needed
    // Add other text style properties as needed
  );
}