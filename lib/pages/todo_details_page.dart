import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/view_model/todos_provider.dart';

import '../models/todo_model.dart';

class TodoDetailsPage extends StatefulWidget {
  final int index;

  const TodoDetailsPage({
    super.key,
    required this.index,
  });

  @override
  State<TodoDetailsPage> createState() => _TodoDetailsPageState();
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodosProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Todo Details',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: todoProvider.todosListenable,
          builder: (context, Box<TodoModel> box, _) {
            final todo = box.getAt(widget.index);
            if (todo == null) {
              return const Center(child: Text("Failed to fetch Todo"));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildDetailRow('Title', todo.title ?? 'No Title'),
                _buildDetailRow(
                    'Description', todo.description ?? 'No Description'),
                _buildDetailRow('Status', todo.status ?? 'Unknown'),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await Navigator.of(context).pushNamed(
                        RouteName.updateTodoScreen,
                        arguments: {'todo': todo, 'index': widget.index},
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: Text(
                      'Edit Todo',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
