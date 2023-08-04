import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/trending_movie_provider.dart';
import 'package:flutter_movie_app/data/provider/trending_tv_provider.dart';
import 'package:flutter_movie_app/ui/account_screen.dart';
import 'package:flutter_movie_app/ui/category_screen.dart';
import 'package:flutter_movie_app/ui/favorite_screen.dart';
import 'package:flutter_movie_app/utils/result_state.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:flutter_movie_app/widgets/trending_movie_widget.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/trending_tv_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOption = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: blackColor,
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
      body: _widgetOption.elementAt(_selectedIndex),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TrendingMovieProvider>(context, listen: false)
          .getTrendingListMovie();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TrendingTvProvider>(context, listen: false)
          .getTrendingListTv();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE BAR
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: myTextTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Dimas Pradipta",
                          style: myTextTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_sharp,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              // SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            height: 50,
                            decoration:
                                const BoxDecoration(color: secondaryColor),
                            child: TextFormField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search_outlined),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          // Provider.of<SearchProvider>(context, listen: false)
                          //     .getListSearch(_searchController.text);
                        },
                        icon: const Icon(Icons.adjust_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

              // MAIN CONTENT

              // TRENDING MOVIE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, bottom: 12.0),
                    child: Text(
                      "Trending Movie",
                      style: myTextTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Consumer<TrendingMovieProvider>(
                    builder: (context, valueTrendingMovie, child) {
                      if (valueTrendingMovie.state == ResultState.loading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (valueTrendingMovie.state == ResultState.error) {
                        return const Text("Error no Data");
                      }
                      return const SizedBox(
                        height: 300,
                        child: TrendingMovieWidget(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Trending Series
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, bottom: 12.0),
                    child: Text(
                      "Trending Series",
                      style: myTextTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Consumer<TrendingTvProvider>(
                    builder: (context, valueTrendingTv, child) {
                      if (valueTrendingTv.state == ResultState.loading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (valueTrendingTv.state == ResultState.error) {
                        return const Text("Error no Data");
                      }
                      return const SizedBox(
                        height: 300,
                        child: TrendingTvWidget(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // CONTENT LAIN
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Another Content",
                      style: myTextTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: 100,
                                width: 250,
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                child:
                                    Text("value.result!.results[index].name"),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
