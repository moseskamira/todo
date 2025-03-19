import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/todo_model.dart';

import 'my_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
  runApp(const MyApp());
}
