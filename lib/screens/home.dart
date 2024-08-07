import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todoList = ToDo.todoList();
  final TextEditingController _searchController = TextEditingController();
  List<ToDo> _filteredTodoList = [];

  @override
  void initState() {
    super.initState();
    _filteredTodoList = todoList;
    _searchController.addListener(_filterTodos);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterTodos);
    _searchController.dispose();
    super.dispose();
  }

  void _filterTodos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTodoList = todoList.where((todo) {
        return todo.todoText!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _deleteTodo(ToDo todo) {
    setState(() {
      _filteredTodoList.remove(todo);
      todoList.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Stack(
          children: [
            Column(
              children: [
                _searchBox(),
                SizedBox(height: 25), // Add space between search box and the list
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20), // Adjust the margin as needed
                    child: ListView.builder(
                      itemCount: _filteredTodoList.length,
                      itemBuilder: (context, index) {
                        final todo = _filteredTodoList[index];
                        return TodoItem(
                          key: Key('todo_item_$index'), // Assign a unique key based on the index
                          todo: todo,
                          onDelete: () => _deleteTodo(todo), // Pass the onDelete callback
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: _inputField(),
    );
  }

  TextField _inputField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGrey),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      style: TextStyle(
        decoration: TextDecoration.none,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: tdBlack, size: 30),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
        ],
      ),
    );
  }
}
