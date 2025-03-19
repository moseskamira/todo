import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/routes/route_name.dart';
import 'package:todo/routes/routes.dart';
import 'package:todo/view_model/todos_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TodosProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo',
            initialRoute: RouteName.homeScreen,
            onGenerateRoute: Routes.generatedRoute,
            locale: const Locale('en'),
          ),
        );
      },
    );
  }
}
