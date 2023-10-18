import 'package:animated_pizza_app/views/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "MyFont",
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    ); 
  }
}
