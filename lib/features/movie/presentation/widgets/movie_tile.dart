import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String title;
  final String genre;
  final String director;
  final String starring;
  final String duration;
  final String language;
  final int releaseDate;
  final int views;
  final int votes;
  final String poster;
  final VoidCallback onWatchTrailer;

  const MovieTile({
    super.key,
    required this.title,
    required this.genre,
    required this.director,
    required this.starring,
    required this.duration,
    required this.language,
    required this.releaseDate,
    required this.views,
    required this.poster,
    required this.votes,
    required this.onWatchTrailer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.grey,
                    size: 50,
                  ),
                  Text(
                    '$votes',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                    size: 50,
                  ),
                  const Text('Votes',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 80,
                height: 200,
                child: Image.network(
                  poster,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Genre: $genre'),
                    Text('Director: $director'),
                    Text('Starring: $starring'),
                    Text('$duration | $language | $releaseDate'),
                    Text('$views views | Voted by $votes People'),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        onPressed: onWatchTrailer,
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text(
                          'Watch Trailer',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
