import 'package:flutter/material.dart';
import 'package:taskify/pages/leading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskify/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
