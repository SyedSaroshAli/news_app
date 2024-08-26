import 'package:flutter/material.dart';
import 'package:news_app/Pages/home.dart';
import 'package:news_app/Pages/landing_page.dart';
import 'package:news_app/Pages/splash_screen.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: Splash(),
      
      
    );
  }
}