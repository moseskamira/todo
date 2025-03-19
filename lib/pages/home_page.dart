import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/view_model/todos_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, e});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ToDo Test'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TodoModel>>(
        future: todoProvider.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) return Text('Could not load Todos');
          if (!snapshot.hasData) return Text('No Todo Found');
          List<TodoModel> myTodos = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10.0,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: myTodos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${myTodos[index].title}'),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteName.todoDetailsScreen,
                              arguments: {'todo': myTodos[index]});
                        },
                        child: Text('More'),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey, // Customize the separator
                thickness: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
