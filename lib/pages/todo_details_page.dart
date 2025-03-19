import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/routes/route_name.dart';

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
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteName.updateTodoScreen,
                    arguments: {'todo': widget.todo});
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Edit Todo',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
