import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'my_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<dynamic>('todoBox');
  runApp(const MyApp());
}
