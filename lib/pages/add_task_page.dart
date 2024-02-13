import 'package:flutter/material.dart';
import 'package:taskify/widgets/alert.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key, required this.addToDoItem}) : super(key: key);

  final Function(String, String) addToDoItem;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgDecor(),
        child: Column(
          children: [
            SizedBox(height: 10*get_scale_factor(context),),
            TaskifyNameplateWithLogOut(context),
            SizedBox(height: 30*get_scale_factor(context),),
            Text("Add a New Task", style: headingStyle(context)),
            SizedBox(height: 60*get_scale_factor(context),),
            InputTextWidget("Add Title", "Your title here", taskTitle, false, context),
            InputTextWidget("Add Description","Your description here", taskDescription, false, context),
            TextButton.icon(
              onPressed: () {
                if(taskTitle.text.isNotEmpty && taskDescription.text.isNotEmpty){
                  widget.addToDoItem(taskTitle.text, taskDescription.text);
                  Navigator.pop(context);
                }else{
                  showAlertDialog("Oops!", "Title or Description cann't be empty", context);
                }

              },
              icon: Icon(Icons.add_task, size: 20 * get_scale_factor(context)),
              label: Text("Add this task", style: normalTextStyle(context)),
            ),
          ],
        ),
      ),
    );
  }
}
