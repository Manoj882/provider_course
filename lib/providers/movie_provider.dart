import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider_course/models/movie_model.dart';

final List<MovieModel> initialData = List.generate(
  50,
  (index) => MovieModel(
    title: 'Movie $index',
    duration: '${Random().nextInt(100) + 60} minutes',
  ),
);

class MovieProvider with ChangeNotifier{
  final List<MovieModel> _movies = initialData;
  List<MovieModel> get movies => _movies;

  final List<MovieModel> _myList = [];
  List<MovieModel> get myList => _myList;

  void addToMyList(MovieModel movie){
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromMyList(MovieModel movie){
    _myList.remove(movie);
    notifyListeners();
  }
}
