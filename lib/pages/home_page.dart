import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taskify/pages/add_task_page.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/task_tile_widget.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import '../model/todo.dart';
import '../model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Todo todo1;
  late Todo todo2;
  late Todo todo3;

  late User user1;
  late List<Todo> todoList;
  List<Todo> foundedToDoFromSearch =[];

  Future<void> fetchTodoList() async {
    try {
      // Fetch the data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection("todo").orderBy('dateTime', descending: false).get();

      // Convert the QuerySnapshot to a List<Todo>
      todoList = querySnapshot.docs
          .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      setState(() {
        foundedToDoFromSearch = todoList;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    // Initialize Todos and User in
    user1 = User(userName: "Fahim", password: "iit123",pin: "11");
    fetchTodoList();
    // todo1 = Todo(id: "1",userName: user1.userName,title: "walk",description: "have to walk",dateTime: DateTime.now(),isDone: false);
    // todo2 = Todo(id: "1",userName: user1.userName,title: "walk22",description: "have to walk",dateTime: DateTime.now(),isDone: false);
    // todo3 = Todo(id: "1",userName: user1.userName,title: "walk2233",description: "have to walk",dateTime: DateTime.now(),isDone: false);
    // // todo2 = Todo("2",user1.userName, "eat", "have to eat", DateTime.now(), false);
    // // todo3 = Todo("3",user1.userName, "sleep", "have to eat", DateTime.now(), false);
    // todoList = [todo1, todo2, todo3];
    // foundedToDoFromSearch = todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgDecor(),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10*get_scale_factor(context),),
                TaskifyNameplateWithLogOut(context),
                searchBox(),
                Expanded(child: ListView(
                  children: [
                    for(Todo todo in foundedToDoFromSearch)
                      ToDoItem(todo: todo,
                        ontodochange: _handleToDoChange,
                        ondelete: _handleDeleteToDOItem,
                      ),
                  ],
                )
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask(addToDoItem: _addToDoItem,)));
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteToDOItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String todoTitle, String todoDescription) {
    String newID = user1.userName + DateTime.now().toString();
    setState(() {
      Todo addedTodo = Todo(
        id: newID,
        userName: "fahim",
        title: todoTitle,
        description: todoDescription,
        dateTime: DateTime.now().toString(),
        isDone: false,
      );
      FirebaseFirestore.instance.collection("todo").add(addedTodo.toMap());
      foundedToDoFromSearch.add(addedTodo);
    });
  }

  void _runFilter(String enteredKeyword){
    List<Todo> results = [];
    if(enteredKeyword.isEmpty){
      results=todoList;
    }else{
      results=todoList
          .where((element) => element.title!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      foundedToDoFromSearch = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5*get_scale_factor(context)),
      margin: EdgeInsets.symmetric(vertical: 15*get_scale_factor(context), horizontal: 20*get_scale_factor(context)),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.white.withOpacity(0.5), // Set the desired border color
          width: 0.6, // Set the desired border width
        ),
      ),
      child: TextField(
        onChanged: (value)=> _runFilter(value),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: hintTextStyle(context),
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20*get_scale_factor(context),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
