import 'package:flutter/material.dart';
import 'package:taskify/pages/add_task_page.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/task_tile_widget.dart';
import 'package:taskify/widgets/taskify_nameplate.dart';
import '../model/todo.dart';
import '../model/user.dart';

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
  @override
  void initState() {
    super.initState();

    // Initialize Todos and User in
    user1 = User("Fahim", "iit123");
    todo1 = Todo("1",user1.userName, "walk", "have to walk", DateTime.now(), false);
    todo2 = Todo("2",user1.userName, "eat", "have to eat", DateTime.now(), false);
    todo3 = Todo("3",user1.userName, "sleep", "have to eat", DateTime.now(), false);
    todoList = [todo1, todo2, todo3];
    foundedToDoFromSearch = todoList;
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
    setState(() {
      Todo addedTodo = new Todo("10", "fahim", todoTitle, todoDescription, DateTime.now(), false);
      foundedToDoFromSearch.add(addedTodo);
      // todoList.add(Todo(id: DateTime.now().toString(), todo_text: todoText),);
    });
    // todoAddController.clear();
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
