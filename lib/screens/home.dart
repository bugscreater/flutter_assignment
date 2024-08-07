import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widgets/todo_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            _searchBox(),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  final todo = todoList[index];
                  return TodoItem(
                    key: Key('todo_item_$index'), // Assign a unique key based on the index
                    todo: todo,
                  );
                },
              ),
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
    return const TextField(
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
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(Icons.menu, color: tdBlack, size: 30),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png')),
        ),
      ]),
    );
  }
}
