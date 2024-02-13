import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/styles.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final ontodochange;
  final ondelete;

  const ToDoItem({Key? key, required this.todo, required this.ontodochange, required this.ondelete}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: bgDecor(),
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
            fontSize: 15*get_scale_factor(context),
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        subtitle: Text(
          todo.description!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15*get_scale_factor(context),
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ensure the Row only takes the minimum space required
          children: [
            IconButton(
              color: Colors.white70,
              icon: Icon(Icons.edit, size: 25*get_scale_factor(context)),
              onPressed: () {
                // Handle edit functionality
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
