import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/providers/movie_provider.dart';

class FavoriteMovieScreen extends StatelessWidget {
  const FavoriteMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies List (${_myList.length})'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _myList.length,
                itemBuilder: (context, index) {
                  final currentMovie = _myList[index];
                  return Card(
                    key: ValueKey(currentMovie.title),
                    color: Colors.blue,
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        currentMovie.duration,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          context.read<MovieProvider>().removeFromMyList(currentMovie);
                        },
                        child: Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
