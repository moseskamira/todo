import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  Box<TodoModel> todoBox = Hive.box('todoBox');

  ValueListenable<Box<TodoModel>> get todosListenable => todoBox.listenable();

  void addToDo(TodoModel todoModel) {
    todoBox.add(todoModel);
  }

  void updateToDo(
      int index, String newTitle, String newDescription, String status) {
    final todo = todoBox.getAt(index);
    if (todo != null) {
      final updatedTodo = TodoModel(
        title: newTitle,
        description: newDescription,
        status: status,
      );
      todoBox.putAt(index, updatedTodo);
    }
  }

  void deleteTodo(int index) {
    todoBox.deleteAt(index);
  }
}
