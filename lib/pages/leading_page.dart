import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskify/pages/home_page.dart';
class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Taskify"),
                Icon(Icons.task),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
