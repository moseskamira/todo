import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../view_model/todos_provider.dart';

class EditToDoPage extends StatefulWidget {
  final TodoModel todo;
  final int index;

  const EditToDoPage({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  State<EditToDoPage> createState() => _EditToDoPageState();
}

class _EditToDoPageState extends State<EditToDoPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  String? _status;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController =
        TextEditingController(text: widget.todo.description);
    _status = widget.todo.status;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Update ToDo',
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
        child: LayoutBuilder(builder: (context, constraints) {
          double maxWidth = constraints.maxWidth * 0.4;
          maxWidth = kIsWeb ? maxWidth : MediaQuery.sizeOf(context).width;
          return Center(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: maxWidth,
                child: Column(
                  mainAxisAlignment: kIsWeb
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.trim().isEmpty ? "Title is required" : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _status,
                      items: ['Pending', 'In Progress', 'Completed']
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child:
                                    Text(status, style: GoogleFonts.poppins()),
                              ))
                          .toList(),
                      decoration: InputDecoration(
                        labelText: "Status",
                        labelStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null ? "Please select a status" : null,
                      onChanged: (newStatus) =>
                          setState(() => _status = newStatus),
                    ),
                    const SizedBox(height: 24),
                    Consumer<TodosProvider>(
                      builder: (context, todoProvider, child) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final updatedTodo = TodoModel()
                                ..title = _titleController.text.trim()
                                ..description =
                                    _descriptionController.text.trim()
                                ..status = _status ?? 'Pending';
                              todoProvider.updateToDo(
                                widget.index,
                                '${updatedTodo.title}',
                                '${updatedTodo.description}',
                                '${updatedTodo.status}',
                              );
                              Navigator.of(context).pop(widget.index);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Save Changes",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
