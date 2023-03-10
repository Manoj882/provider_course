import 'package:flutter/material.dart';
import 'package:provider_course/providers/movie_provider.dart';
import 'package:provider_course/providers/post_provider.dart';
import 'package:provider_course/screens/movies/movie_screen.dart';
import 'package:provider_course/screens/posts/post_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // create: (_) => PostProvider(),
      create: (_) => MovieProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: PostScreen(),
        home: MovieScreen(),
      ),
    );
  }
}


