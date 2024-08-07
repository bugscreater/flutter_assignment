import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late bool _isDone;

  @override
  void initState() {
    super.initState();
    _isDone = widget.todo.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: _listTile(todo: widget.todo, isDone: _isDone, onCheckboxChanged: _toggleCheckbox),
    );
  }

  void _toggleCheckbox(bool? newValue) { // Adjusted to accept bool? instead of bool
    if (newValue != null) {
      setState(() {
        _isDone = newValue;
        widget.todo.toggleDone(); // Update the TodoItem's isDone status
      });
    }
  }
}

class _listTile extends StatelessWidget {
  final ToDo todo;
  final bool isDone;
  final ValueChanged<bool?> onCheckboxChanged; // Adjusted to accept bool? instead of bool

  const _listTile({
    Key? key,
    required this.todo,
    required this.isDone,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Clicked on todo item...');
        onCheckboxChanged(!isDone); // Toggle the checkbox status
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.white,
      leading: Checkbox(
        value: isDone,
        onChanged: onCheckboxChanged, // Pass the onCheckboxChanged function directly
        activeColor: tdBlue,
      ),
      title: Text(
        todo.todoText ?? '',
        style: TextStyle(
          fontSize: 18,
          color: tdBlack,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
        width: 35,
        decoration: BoxDecoration(color: tdRed, borderRadius: BorderRadius.circular(5)),
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
