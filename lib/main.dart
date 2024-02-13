import 'package:flutter/material.dart';
import 'package:taskify/pages/leading_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent, // Set a transparent background for the gradient
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all(Colors.teal.shade900),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal.shade900,
      ),
    ),
    home: SafeArea(
      child:  LeadingPage(),
      ),
    ),
  );
}
