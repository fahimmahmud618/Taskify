import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/pages/sign_in.dart';
import 'package:taskify/pages/home_page.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
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
            Text("Password Recovery", style: headingStyle(context)),
            SizedBox(height: 60*get_scale_factor(context),),
            InputTextWidget("Your Username", "Username",usernameController, false, context),
            InputTextWidget("Recovery Pin (Enter the pin set during signup)", "Recovery Pin",recoveryPinController, true, context),
            InputTextWidget("New Password (At least 6 character)", "Password", passwordController, true, context),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Set new Password", style: normalTextStyle(context)),
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
