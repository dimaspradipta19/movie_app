import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
                        "assets/action.jpg",
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
                              "Adventure",
                              style: myTextTheme.headline5!.copyWith(
                                  color: whiteColor, fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
