import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class EditToDoPage extends StatefulWidget {
  final TodoModel todo;

  const EditToDoPage({
    super.key,
    required this.todo,
  });

  @override
  State<EditToDoPage> createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<EditToDoPage> {
  TodoModel todoModel = TodoModel();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void initializeValues() {
    final model = widget.todo;
    todoModel
      ..title = model.title
      ..description = model.description
      ..status = model.status;

    _titleController.text = '${todoModel.title}';
    _descriptionController.text = '${todoModel.description}';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Update ToDo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8.0,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
              validator: (value) => value!.isEmpty ? "Title is required" : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
          ],
        ),
      ),
    );
  }
}
