import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/providers/movie_provider.dart';
import 'package:provider_course/screens/movies/fav_movies_screen.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MovieProvider>().movies;
    final myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoriteMovieScreen(),
                  ),
                );
              },
              icon: Icon(Icons.favorite_outlined),
              label: Text(
                'Go to MyList (${myList.length})',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final currentMovie = movies[index];
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
                      trailing: IconButton(
                        onPressed: () {
                          if (!myList.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .addToMyList(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removeFromMyList(currentMovie);
                          }
                        },
                        icon: Icon(
                          Icons.favorite_outlined,
                          color: myList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
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
