import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/service/trending_tv_service.dart';
import 'package:provider/provider.dart';

import '../data/provider/detail_movie_provider.dart';
import '../ui/detail_screen.dart';
import '../utils/result_state.dart';

class TrendingTvWidget extends StatelessWidget {
  const TrendingTvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TrendingTvService().getTrendingTvList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    // Provider.of<DetailProvider>(context, listen: false)
                    //     .getDetail(snapshot.data!.results[index].id.toString());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return DetailScreen(
                    //         id: snapshot.data!.results[index].id.toString(),
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${snapshot.data!.results[index].posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.connectionState == ResultState.error) {
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
