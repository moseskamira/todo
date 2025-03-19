import '../models/todo_model.dart';

class TodoData {
  static List<TodoModel> todos() {
    return [
      TodoModel(
        title: 'First Todo',
        description: 'This is the first todo',
        status: 'Completed',
      ),
      TodoModel(
        title: 'Second Todo',
        description: 'This is the Second todo',
        status: 'Completed',
      ),
      TodoModel(
        title: 'Third Todo',
        description: 'This is the Third todo',
        status: 'Completed',
      ),
      TodoModel(
        title: 'Fouth Todo',
        description: 'This is the Fouth todo',
        status: 'Completed',
      ),
    ];
  }
}
