import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:taskify/cache_handle.dart';
import 'package:taskify/pages/add_task_page.dart';
import 'package:taskify/styles.dart';
import 'package:taskify/widgets/alert.dart';
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

  String currentUser ="";
  late String cUser;
  late Todo todo1;
  late Todo todo2;
  late Todo todo3;

  late User user1;
  late List<Todo> todoList;
  List<Todo> foundedToDoFromSearch =[];

  Future<void> fetchTodoList() async {
    try {
      currentUser = await ReadCache.getString(key: "cache") ;
      currentUser = getUserNameFromChache(caesarCipherDecode(currentUser,2));
      // Fetch the data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection("todo").where('userName', isEqualTo: currentUser).orderBy('dateTime', descending: false).get();

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
    user1 = User(userName: "Fahim", password: "iit123",pin: "11");
    fetchTodoList();
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
                Container(
                    margin: EdgeInsets.fromLTRB(20*get_scale_factor(context), 5*get_scale_factor(context), 20*get_scale_factor(context),10*get_scale_factor(context)),
                    alignment: Alignment.topLeft,
                    child: Text("Welcome ~$currentUser~", style: normalTextStyle(context),)),
                searchBox(),
                Expanded(child: ListView(
                  children: [
                    foundedToDoFromSearch.length==0?
                        Container(
                            margin: EdgeInsets.fromLTRB(50*get_scale_factor(context), 150*get_scale_factor(context), 50*get_scale_factor(context),10*get_scale_factor(context)),
                            child: Text("You currently have no tasks. Click on the '+' button in the bottom right to add some tasks.")):Text(""),
                    for(Todo todo in foundedToDoFromSearch)
                      ToDoItem(todo: todo,
                        ontodochange: _handleToDoChange,
                        ondelete: _handleDeleteToDOItem,
                        onedit: _handleTodoEdit,
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
    updateisDone(todo.id, !todo.isDone);
  }

  void _handleTodoEdit(Todo todo, String newT, String newD) {
    updatetodo(todo, newT, newD);
    setState(() {
      fetchTodoList();
    });
  }

  void _handleDeleteToDOItem(String id) async{
    setState(()  {
      todoList.removeWhere((element) => element.id == id);
    });
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('todo')
          .where('id', isEqualTo: id)
          .get();

      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

    } catch (e) {
      showAlertDialog("Error", 'Error deleting todo: $e', context);
    }

  }

  void _addToDoItem(String todoTitle, String todoDescription) {
    String newID = user1.userName + DateTime.now().toString();
    setState(() {
      Todo addedTodo = Todo(
        id: newID,
        userName: currentUser,
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
          .where((element) => element.title
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      foundedToDoFromSearch = results;
    });
  }

  Future<void> updateisDone(String id, bool isnowDone) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('todo')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming 'userName' is unique, so there should be only one document
        final userDocument = querySnapshot.docs.first;
        await FirebaseFirestore.instance
            .collection('todo')
            .doc(userDocument.id) // Use the document ID to update the specific document
            .update({
          'isDone': !isnowDone,
        });

      } else {
      }
    } catch (e) {
      showAlertDialog("Error!", 'Error updating todo: $e', context);
    }
  }

  Future<void> updatetodo(Todo todo, String newtitle, String newdescription) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('todo')
          .where('id', isEqualTo: todo.id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming 'userName' is unique, so there should be only one document
        final userDocument = querySnapshot.docs.first;
        await FirebaseFirestore.instance
            .collection('todo')
            .doc(userDocument.id) // Use the document ID to update the specific document
            .update({
          'title': newtitle,
          'description': newdescription,
        });

      } else {
      }
    } catch (e) {
      print('Error updating TTodo: $e');
    }
  }


  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5*get_scale_factor(context)),
      margin: EdgeInsets.fromLTRB(20*get_scale_factor(context), 15*get_scale_factor(context), 20*get_scale_factor(context), 0),
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
          hintText: "Search a task",
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
