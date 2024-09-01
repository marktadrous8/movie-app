import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/movie.dart';

class Item extends StatelessWidget {
  final Movie movie;
  final int crossAxisCount;

  const Item({
    required this.movie,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the BoxFit and Alignment based on the current grid or list view
    BoxFit imageFit = BoxFit.cover;
    Alignment imageAlignment = Alignment.topCenter;
    double aspectRatio = crossAxisCount == 1 ? 16 / 9 : 2 / 3;

    return AspectRatio(
      aspectRatio: aspectRatio, // Adjust aspect ratio based on the grid or list view
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: imageFit,  // Apply the dynamically determined BoxFit
                  alignment: imageAlignment,  // Apply the top alignment
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
