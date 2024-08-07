import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20), child: _listTile(todo: todo));
  }
}

class _listTile extends StatelessWidget {
  final ToDo todo;
  const _listTile({
    super.key,
    required this.todo
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Clicked on todo item...');
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.white,
      leading: Icon(Icons.check_box, color: tdBlue),
      title: Text(
        todo.todoText ?? '',
        style: TextStyle(
            fontSize: 18,
            color: tdBlack,
            decoration: todo.isDone?TextDecoration.lineThrough:null),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
        width: 35,
        decoration:
            BoxDecoration(color: tdRed, borderRadius: BorderRadius.circular(5)),
        child: IconButton(
          color: Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
