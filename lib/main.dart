import 'package:flutter/material.dart';
import 'package:taskify/pages/leading_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent,),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightGreenAccent
      )
    ),
    home: SafeArea(
      child: LeadingPage(),
    ),
  ));
}
