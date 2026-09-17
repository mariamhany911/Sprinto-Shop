import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';
import 'package:sprints_project/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: 'Suwannaphum',
          colorScheme: ColorScheme.dark(),
          appBarTheme: AppBarTheme(backgroundColor:  Color.fromARGB(255, 10, 84, 145),),
          
        ),
        routes: AppRoutes.routes,
        initialRoute: RouteName.initRoute,
    );
    }
    }
