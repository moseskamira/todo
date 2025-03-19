import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/todo_model.dart';

import '../routes/route_name.dart';
import '../widgets/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box todoBox = Hive.box('todoBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'ToDo List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, Box<dynamic> box, _) {
          if (box.isEmpty) {
            return Center(child: Text('No Todos Yet. Please add Todo'));
          }
          return ListView.separated(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final todo = box.getAt(index);
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  title: Text(
                    todo['title'] ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    todo['description'] ?? 'No Description',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.more_horiz, color: Colors.blue),
                        onPressed: () {
                          TodoModel tm = TodoModel();
                          tm.title = todo['title'];
                          tm.description = todo['description'];
                          tm.status = todo['status'];
                          Navigator.of(context).pushNamed(
                            RouteName.todoDetailsScreen,
                            arguments: {'todo': tm},
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // todoProvider.deleteTodo(todo.id!);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodoDialog(todoBox: todoBox),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
