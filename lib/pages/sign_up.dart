import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/pages/home_page.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/pages/sign_in.dart';

import '../model/user.dart';

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
        decoration: bgDecor(),
        child: Column(
          children: [
            SizedBox(height: 10*get_scale_factor(context),),
            TaskifyNameplate(context),
            SizedBox(height: 30*get_scale_factor(context),),
            Text("Sign up in Taskify", style: headingStyle(context)),
            SizedBox(height: 60*get_scale_factor(context),),
            InputTextWidget("Your Username (User name should be unique)", "Username",usernameController, false, context),
            InputTextWidget("Password (At least 6 character)", "Password", passwordController, true, context),
            InputTextWidget("Ricovry Pin (This will be used in case of password being forgotten)", "Recovery Pin",recoveryPinController, true, context),
            TextButton.icon(
              onPressed: () {
                  User newUser = new User(
                    userName: usernameController.text,
                    password: passwordController.text,
                    pin: recoveryPinController.text,
                  );
                  try {
                    FirebaseFirestore.instance.collection("user").add(newUser.toMap());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  } on Exception catch (e) {
                    print(e);
                  }

              },
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Sign Up", style: normalTextStyle(context)),
            ),
            InkWell(
              onTap: (){
                print("sign in pressed");
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Text("Already have an account? Sign in", style: normalTextStyle(context)),
            ),
          ],
        ),
      ),
    );
  }
}
