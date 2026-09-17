import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Products"),
        actions: [
          Text("Logout"),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteName.initRoute,(route)=>false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

    );
  }
}
