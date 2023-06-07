import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/trending_movie_provider.dart';
import 'package:flutter_movie_app/ui/detail_screen.dart';
import 'package:provider/provider.dart';

import '../utils/result_state.dart';

class TrendingMovieWidget extends StatelessWidget {
  const TrendingMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Consumer
    return Consumer<TrendingMovieProvider>(
      builder: (context, TrendingMovieProvider valueMovie, _) {
        if (valueMovie.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (valueMovie.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: valueMovie.result!.results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(
                            id: valueMovie.result!.results[index].id,
                          );
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          const CircularProgressIndicator.adaptive(),
                      imageUrl:
                          "https://image.tmdb.org/t/p/original/${valueMovie.result!.results[index].posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        } else if (valueMovie.state == ResultState.error) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const Center(
            child: Text("Kosong"),
          );
        }
      },
    );
  }
}
