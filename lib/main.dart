import 'package:flutter/material.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/pages/home.dart';
import 'package:navigation_practice/pages/login.dart';
import 'package:navigation_practice/router/app_router.dart';
import 'package:navigation_practice/theme/app_theme.dart';

void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  final UserData userData = UserData(
    name: '',
    email: '',
  );  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:  "My App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig:createRouter(userData),
    );
  }
}