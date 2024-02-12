import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController recoveryPinController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TaskifyNameplate(context),
            Text("Sign up in Taskify", style: headingStyle(context)),
            InputTextWidget("Your Username (User name should be unique)", usernameController, context),
            InputTextWidget("Password (At least 6 character)", passwordController, context),
            InputTextWidget("Ricovry Pin (This will be used in case of password being forgotten)", recoveryPinController, context),
          ],
        ),
      ),
    );
  }
}
