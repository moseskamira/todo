import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class EditToDoPage extends StatefulWidget {
  final TodoModel todo;

  const EditToDoPage({super.key, required this.todo});

  @override
  State<EditToDoPage> createState() => _EditToDoPageState();
}

class _EditToDoPageState extends State<EditToDoPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String? _status;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController =
        TextEditingController(text: widget.todo.description);
    _status = widget.todo.status ?? 'Pending';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'status': _status,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Update ToDo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Title Field
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.trim().isEmpty ? "Title is required" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _status,
                    items: ['Pending', 'In Progress', 'Completed']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: "Status",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newStatus) {
                      setState(() {
                        _status = newStatus;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
