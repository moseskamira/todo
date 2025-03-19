import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/routes/route_name.dart';

import '../pages/todo_details_page.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        );

      case RouteName.todoDetailsScreen:
        Map<String, Object>? args = settings.arguments as Map<String, Object>;
        TodoModel todoModel = args['todo'] as TodoModel;
        return MaterialPageRoute(
            builder: (BuildContext context) => TodoDetailsPage(
                  todo: todoModel,
                ));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
