import 'package:flutter/material.dart';
import 'package:taskify/widgets/input_widgets.dart';
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
            Text("Add a New Task"),
            InputTextWidget("Add Title",taskTitle),
            InputTextWidget("Add Description",taskDescription),
            TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.add_task),
                label: Text("Add this task"),

            ),

          ],
        ),
      ),
    );
  }
}
