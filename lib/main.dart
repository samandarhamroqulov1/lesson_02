import 'package:flutter/material.dart';
import 'package:lesson_02/home_page.dart';
import 'package:lesson_02/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroPage(),
      routes: {
       HomePage.id:(context)=>HomePage(),
       IntroPage.id:(context)=>HomePage(),
      }
    );
  }
}


