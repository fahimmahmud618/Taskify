import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/pages/update_task_page.dart';
import 'package:taskify/styles.dart';
import '../model/todo.dart';
import 'package:intl/intl.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final ontodochange;
  final ondelete;
  final onedit;

  const ToDoItem({Key? key, required this.todo, required this.ontodochange, required this.ondelete, required this.onedit}): super(key:key);
  String formatDateTimeString(String dateTimeString) {
    // Parse the DateTime string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime
    String formattedDateTime = DateFormat('d MMMM y, h:mm a').format(dateTime);

    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: tileDecor(),
      margin: EdgeInsets.fromLTRB(20*get_scale_factor(context), 5*get_scale_factor(context), 20*get_scale_factor(context),10*get_scale_factor(context)),

      child: ListTile(
        onTap: (){
          ontodochange(todo);
          print('clicked on the tile');
        },
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.white,
            size: 25*get_scale_factor(context)
        ),
        title: Text(
          todo.title!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17*get_scale_factor(context),
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        subtitle: Column(
          children: [
            SizedBox(height: 6*get_scale_factor(context),),
            Text(
              todo.description!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15*get_scale_factor(context),
                decoration: todo.isDone? TextDecoration.lineThrough: null,
              ),
            ),
            SizedBox(height: 10*get_scale_factor(context),),
            Text(
              formatDateTimeString(todo.dateTime!),
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13*get_scale_factor(context),
                decoration: todo.isDone? TextDecoration.lineThrough: null,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ensure the Row only takes the minimum space required
          children: [
            IconButton(
              color: Colors.white70,
              icon: Icon(Icons.edit, size: 25*get_scale_factor(context)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateTodoItem(todo: todo, editF: onedit,)));
                print('edit button');
              },
            ),
            SizedBox(width: 8*get_scale_factor(context)), // Adjust the width as needed for spacing
            IconButton(
              color: Colors.pinkAccent,
              icon: Icon(Icons.delete, size: 25*get_scale_factor(context)),
              onPressed: () {
                ondelete(todo.id);
                print('delete button');
              },
            ),
          ],
        ),
      ),
    );
  }
}
