import 'package:flutter/material.dart';
import 'package:taskify/widgets/alert.dart';
import 'package:taskify/widgets/input_widget.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import '../model/todo.dart';

class UpdateTodoItem extends StatefulWidget {
  const UpdateTodoItem({Key? key, required this.todo, required this.editF}) : super(key: key);
  final Todo todo;
  final Function(Todo, String t, String d) editF;
  @override
  State<UpdateTodoItem> createState() => _UpdateTodoItemState();
}

class _UpdateTodoItemState extends State<UpdateTodoItem> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskTitle.text = widget.todo.title;
    taskDescription.text = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgDecor(),
        child: Column(
          children: [
            SizedBox(height: 10 * get_scale_factor(context)),
            TaskifyNameplateWithLogOut(context),
            SizedBox(height: 30 * get_scale_factor(context)),
            Text("Update Your Task", style: headingStyle(context)),
            SizedBox(height: 60 * get_scale_factor(context)),
            InputTextWidget("Update Title", widget.todo.title, taskTitle, false, context),
            InputTextWidget("Update Description", widget.todo.description, taskDescription, false, context),
            TextButton.icon(
              onPressed: () {
                if (taskTitle.text.isNotEmpty && taskDescription.text.isNotEmpty) {
                  widget.editF(widget.todo, taskTitle.text, taskDescription.text);
                  Navigator.pop(context);
                } else {
                  showAlertDialog("Oops!", "Title or Description can't be empty", context);
                }
              },
              icon: Icon(Icons.add_task, size: 20 * get_scale_factor(context)),
              label: Text("Update this task", style: normalTextStyle(context)),
            ),
          ],
        ),
      ),
    );
  }
}
