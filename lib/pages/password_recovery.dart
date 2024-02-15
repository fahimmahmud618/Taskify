import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/widgets/alert.dart';
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
            InputTextWidgetPass("Recovery Pin (Enter the pin set during signup)", "Recovery Pin",recoveryPinController, true, context),
            InputTextWidgetPass("New Password (At least 6 character)", "Password", passwordController, true, context),
            TextButton.icon(
              onPressed: () {
                if(usernameController.text.isNotEmpty && recoveryPinController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  updatePassword(usernameController.text,recoveryPinController.text, passwordController.text);
                }else{
                  showAlertDialog("Error", "Field can not be empty", context);
                }

              },
              icon: Icon(Icons.person, size: 20 * get_scale_factor(context)),
              label: Text("Set new Password", style: normalTextStyle(context)),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> updatePassword(String userName, String pin, String newPassword) async {
    try {
      print("password recovery statred");
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('userName', isEqualTo: userName)
          .where('pin', isEqualTo: pin)
          .get();

      print(querySnapshot);
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming 'userName' is unique, so there should be only one document
        final userDocument = querySnapshot.docs.first;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(userDocument.id) // Use the document ID to update the specific document
            .update({
          'password': newPassword,
        });
        showAlertDialog("Info", 'Password has reset', context);
        Navigator.pop(context);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
        print('Password updated successfully!');
      } else {
        showAlertDialog("Error!", 'Wrong username or pin', context);
        print('Username of pin wrong');
      }
    } catch (e) {
      print('Error updating password: $e');
    }
  }


}
