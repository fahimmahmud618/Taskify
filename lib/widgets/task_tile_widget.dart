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
      margin: EdgeInsets.only(bottom: 20),
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
        ),
        title: Text(
          todo.title!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        subtitle: Text(
          todo.description!,
          style: TextStyle(
            color: Colors.white,
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ensure the Row only takes the minimum space required
          children: [
            IconButton(
              color: Colors.white70,
              icon: Icon(Icons.edit),
              onPressed: () {
                // Handle edit functionality
                print('edit button');
              },
            ),
            SizedBox(width: 8), // Adjust the width as needed for spacing
            IconButton(
              color: Colors.pinkAccent,
              icon: Icon(Icons.delete),
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
