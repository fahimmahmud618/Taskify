import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String userName;
  String title;
  String description;
  String dateTime; // Change type to DateTime
  bool isDone;

  Todo({
    required this.id,
    required this.userName,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      userName: map['userName'],
      title: map['title'],
      description: map['description'],
      dateTime: map['dateTime'],
      isDone: map['isDone'],
    );
  }
}
