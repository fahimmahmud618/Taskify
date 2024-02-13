import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/pages/sign_up.dart';
import 'package:taskify/pages/home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TaskifyNameplate(context),
            Text("Sign up in Taskify", style: headingStyle(context)),
            InputTextWidget("Your Username (User name should be unique)", "Username",usernameController, context),
            InputTextWidget("Password (At least 6 character)", "Password", passwordController, context),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Sign In", style: normalTextStyle(context)),
            ),
            InkWell(
              onTap: (){
                print("sign in pressed");
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text("Don't have an account? Sign Up", style: normalTextStyle(context)),
            ),
          ],
        ),
      ),
    );
  }
}
