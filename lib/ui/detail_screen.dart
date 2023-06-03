import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/detail_movie_provider.dart';
import 'package:flutter_movie_app/utils/result_state.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProvider>(context, listen: false).getDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<DetailProvider>(
            builder: (context, DetailProvider valueProvider, _) {
          if (valueProvider.state == ResultState.loading) {
            return const Center(
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          } else if (valueProvider.state == ResultState.hasData) {
            return Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) => const Center(
                                child: CircularProgressIndicator.adaptive()),
                            imageUrl:
                                "https://image.tmdb.org/t/p/original/${valueProvider.detailModel!.backdropPath}",
                          ),
                        ),
                        Text(valueProvider.detailModel?.originalTitle ??
                            "Kosong"),
                        ElevatedButton(
                            onPressed: () {
                              print("A");
                            },
                            child: Text("A"))
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(color: primaryColor),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (valueProvider.state == ResultState.noData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cannot load Data"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kembali ke beranda"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        }),
      ),
    );
  }
}
