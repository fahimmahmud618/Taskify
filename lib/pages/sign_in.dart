import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/pages/sign_up.dart';
import 'package:taskify/pages/home_page.dart';
import 'package:taskify/pages/password_recovery.dart';
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
        decoration: bgDecor(),
        child: Column(
          children: [
            SizedBox(height: 10*get_scale_factor(context),),
            TaskifyNameplate(context),
            SizedBox(height: 30*get_scale_factor(context),),
            Text("Sign in in Taskify", style: headingStyle(context)),
            SizedBox(height: 60*get_scale_factor(context),),
            InputTextWidget("Your Username (User name should be unique)", "Username",usernameController, false, context),
            InputTextWidget("Password (At least 6 character)", "Password", passwordController, true, context),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Sign In", style: normalTextStyle(context)),
            ),
            InkWell(
              onTap: (){
                print("Forgot pass pressed");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordRecovery()));
              },
              child: Text("Forgot Password?", style: normalTextStyle(context)),
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
