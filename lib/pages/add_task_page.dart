import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            TaskifyNameplate(context),
            Text("Add a New Task", style: headingStyle(context)),
            InputTextWidget("Add Title", "Your title here", taskTitle, false, context),
            InputTextWidget("Add Description","Your description here", taskDescription, false, context),
            TextButton.icon(
              onPressed: () {
                widget.addToDoItem(taskTitle.text, taskDescription.text);
                Navigator.pop(context);
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
