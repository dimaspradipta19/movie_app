import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/detail_movie_provider.dart';
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
          return const Center(child: CircularProgressIndicator());
        } else if (valueMovie.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: valueMovie.result!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    print(valueMovie.result![index].title);
                    Provider.of<DetailProvider>(context, listen: false)
                        .getDetail(valueMovie.result![index].id.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(
                            id: valueMovie.result![index].id.toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${valueMovie.result![index].posterPath}",
                        fit: BoxFit.cover,
                      ),
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

// Using Future Builder
    // FutureBuilder(
    //   future: TrendingMovieService().getTrendingMovieList(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError){
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasData) {
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         scrollDirection: Axis.horizontal,
    //         itemCount: snapshot.data?.length,
    //         itemBuilder: (context, index) {
    //           return Padding(
    //             padding: const EdgeInsets.only(right: 8.0),
    //             child: InkWell(
    //               onTap: () {
    //                 Provider.of<DetailProvider>(context, listen: false)
    //                     .getDetail(snapshot.data![index].id.toString());
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) {
    //                       return DetailScreen(
    //                         id: snapshot.data![index].id.toString(),
    //                       );
    //                     },
    //                   ),
    //                 );
    //               },
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(30),
    //                 child: Container(
    //                   width: 200,
    //                   decoration: BoxDecoration(color: Colors.grey[300]),
    //                   child: Image.network(
    //                     "https://image.tmdb.org/t/p/original/${snapshot.data![index].posterPath}",
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     } else if (snapshot.connectionState == ResultState.error) {
    //       return const Center(
    //         child: Text("Error"),
    //       );
    //     } else {
    //       return const Center(
    //         child: Text("Kosong"),
    //       );
    //     }
    //   },
    // );
