import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/genre_provider.dart';
import 'package:flutter_movie_app/ui/home.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListGenreProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Movii',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: myTextTheme,
        ),
        home: const Home(),
      ),
    );
  }
}
