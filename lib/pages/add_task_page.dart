import 'package:flutter/material.dart';
import 'package:taskify/widgets/input_widgets.dart';
import 'package:taskify/styles.dart';
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController taskTitle = new TextEditingController();
  TextEditingController taskDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Add a New Task", style: headingStyle(context),),
            InputTextWidget("Add Title",taskTitle, context),
            InputTextWidget("Add Description",taskDescription, context),
            TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.add_task,size: 20*get_scale_factor(context),),
                label: Text("Add this task", style: normalTextStyle(context),),

            ),

          ],
        ),
      ),
    );
  }
}
