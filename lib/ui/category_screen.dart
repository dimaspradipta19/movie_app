import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/genre_provider.dart';
import 'package:flutter_movie_app/utils/result_state.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  // HIT API BY OPENED CATEGORY PAGE
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ListGenreProvider>(context, listen: false).getList();
    });
  }

  List<String> images = [
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",
    "assets/action.jpg",

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Consumer<ListGenreProvider>(
          builder: (context, ListGenreProvider provider, _) {
            if (provider.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == ResultState.hasData) {
              return ListView.builder(
                itemCount: provider.result.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: secondaryColor,
                            ),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: 200,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        blackColor,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6.0,
                                  right: 10.0,
                                  child: Text(
                                    // "Adventure",
                                    provider.result[index].name,
                                    style: myTextTheme.headline5!.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (provider.state == ResultState.noData) {
              return const Center(
                child: Text("No Data Found"),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
