import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  Box<TodoModel> todoBox = Hive.box('todoBox');

  ValueListenable<Box<TodoModel>> get todosListenable => todoBox.listenable();

  void addToDo(TodoModel todoModel) {
    todoBox.add(todoModel);
  }
}
