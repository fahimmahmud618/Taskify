import 'package:flutter/material.dart';
import 'package:taskify/widgets/alert.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/pages/sign_up.dart';
import 'package:taskify/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskify/pages/password_recovery.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    final userName = usernameController.text;
    final password = passwordController.text;

    try {
      // Query Firestore to check if the user exists with the provided credentials
      final querySnapshot = await FirebaseFirestore.instance
          .collection("user")
          .where('userName', isEqualTo: userName)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User found, navigate to home page
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        // User not found or credentials don't match
        // You can show an error message or handle it accordingly
        showAlertDialog("Oops!", "Invalid username or password", context);
        print("Invalid credentials");
      }
    } catch (e) {
      // Handle exceptions
      print(e);
    }
  }

  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgDecor(),
        child: Column(
          children: [
            SizedBox(height: 10 * get_scale_factor(context)),
            TaskifyNameplate(context),
            SizedBox(height: 30 * get_scale_factor(context)),
            Text("Sign in in Taskify", style: headingStyle(context)),
            SizedBox(height: 60 * get_scale_factor(context)),
            InputTextWidget("Your Username (User name should be unique)", "Username", usernameController, false, context),
            InputTextWidget("Password (At least 6 characters)", "Password", passwordController, true, context),
            TextButton.icon(
              onPressed: signIn,
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Sign In", style: normalTextStyle(context)),
            ),
            InkWell(
              onTap: () {
                print("Forgot pass pressed");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordRecovery()));
              },
              child: Text("Forgot Password?", style: normalTextStyle(context)),
            ),
            InkWell(
              onTap: () {
                print("sign up pressed");
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
