import 'dart:async';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:taskify/pages/home_page.dart';
import 'package:taskify/pages/sign_up.dart';
import '../styles.dart';
class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {

  Future initiateChache() async{
    CacheManagerUtils.conditionalCache(
        key: "cache",
        valueType: ValueType.StringValue,
        actionIfNull: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
        },
        actionIfNotNull: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
    );
  }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), initiateChache);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: bgDecor(),
          child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 20*get_scale_factor(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task, size: 25*get_scale_factor(context), color: Colors.teal.shade400,),
            Text("Taskify", style: logoTextStyle(context),),
          ],
        ),
      )
          ),
        ),
      ),
    );
  }

}
