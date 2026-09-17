import 'package:flutter/material.dart';
import 'package:sprints_project/home_screen.dart';
import 'package:sprints_project/login_screen.dart';
import 'package:sprints_project/routes/route_name.dart';
import 'package:sprints_project/screens/welcome_screen.dart';
import 'package:sprints_project/sign_up_screen.dart';

class AppRoutes{
  static final Map<String,Widget Function(BuildContext)> routes={
    RouteName.initRoute : (context) => WelcomeScreen(),
    RouteName.homeRoute : (context) => HomeScreen(),
    RouteName.loginRoute : (context) => LoginScreen(),
    RouteName.signUpRoute : (context) => SignUpScreen(),
  };
}