import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoDetailsPage extends StatefulWidget {
  final TodoModel todo;

  const TodoDetailsPage({
    super.key,
    required this.todo,
  });

  @override
  State<TodoDetailsPage> createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Details Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8.0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Text(
                  'Title:',
                ),
                Text(
                  '${widget.todo.title}',
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Description:',
                ),
                Text(
                  '${widget.todo.description}',
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Status:',
                ),
                Text(
                  '${widget.todo.status}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
