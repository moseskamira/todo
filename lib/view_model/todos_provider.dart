import 'package:flutter/material.dart';
import 'package:todo/data_source/todo_data.dart';
import 'package:todo/models/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  Future<List<TodoModel>> fetchTodos() async {
    return TodoData.todos();
  }
}
