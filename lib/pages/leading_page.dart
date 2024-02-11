import 'package:flutter/material.dart';
class LeadingPage extends StatelessWidget {
  const LeadingPage({super.key});

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
