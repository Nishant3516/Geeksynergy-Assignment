import 'package:flutter/material.dart';
import 'package:geeksynergy/features/movie/data/repositories/movie_repositories.dart';
import 'package:geeksynergy/features/movie/presentation/pages/company_info.dart';
import 'package:geeksynergy/features/movie/presentation/widgets/movie_tile.dart';

class MoviesPage extends StatelessWidget {
  final MovieRepository movieRepository;
  const MoviesPage({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Company Info'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompanyInfoPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: movieRepository.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Movies Found'));
          } else {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieTile(
                  title: movie['title'] ?? 'Unknown Title',
                  genre: movie['genre'] ?? 'Unknown Genre',
                  director: movie['director'][0] ?? 'Unknown Director',
                  starring: movie['starring'] ?? 'Unknown Cast',
                  duration: '${movie['runtime'] ?? 'Unknown'} mins',
                  language: movie['language'] ?? 'Unknown',
                  releaseDate: movie['releasedDate'] ?? 'Unknown',
                  poster: movie['poster'] ?? 'Unknown',
                  views: movie['views'] ?? 0,
                  votes: movie['totalVoted'] ?? 0,
                  onWatchTrailer: () {
                    // Implement trailer watching logic here
                    print('Watch trailer for ${movie['title']}');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
