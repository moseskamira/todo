import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../view_model/todos_provider.dart';

class AddTodoDialog extends StatelessWidget {
  final Box<dynamic> todoBox;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  AddTodoDialog({super.key, required this.todoBox});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodosProvider>(context);
    return AlertDialog(
      title: TextField(
        controller: _titleController,
        decoration: InputDecoration(hintText: 'Todo title'),
      ),
      content: TextField(
        controller: _descController,
        decoration: InputDecoration(hintText: 'Enter todo Description'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _descController.text.isNotEmpty) {
              TodoModel tModel = TodoModel();
              tModel
                ..title = _titleController.text.trim()
                ..description = _descController.text.trim()
                ..status = 'Pending';
              todoProvider.addToDo(tModel);

              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
