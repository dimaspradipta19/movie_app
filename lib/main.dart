import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/home.dart';
import 'package:flutter_movie_app/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movii',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: myTextTheme
      ),
      home: Home(),
    );
  }
}
