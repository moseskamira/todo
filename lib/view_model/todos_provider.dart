import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data_source/todo_data.dart';
import 'package:todo/models/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  Box<dynamic> todoBox = Hive.box('todoBox');

  Future<List<TodoModel>> fetchTodos() async {
    return TodoData.todos();
  }

  void addToDo(TodoModel todoModel) {
    todoBox.add(todoModel.toJson());
  }
}
