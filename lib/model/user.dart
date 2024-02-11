import 'package:taskify/model/todo.dart';

class User{
  String userName;
  String password;
  List<Todo>? todoList;

  User(this.userName, this.password);

  void addTodo(Todo todo){
    this.todoList?.add(todo);
  }
}