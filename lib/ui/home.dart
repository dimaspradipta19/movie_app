import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/search_provider.dart';
import 'package:flutter_movie_app/data/provider/trending_provider.dart';
import 'package:flutter_movie_app/data/service/trending_service.dart';
import 'package:flutter_movie_app/ui/account_screen.dart';
import 'package:flutter_movie_app/ui/category_screen.dart';
import 'package:flutter_movie_app/ui/favorite_screen.dart';
import 'package:flutter_movie_app/utils/result_state.dart';
import 'package:flutter_movie_app/utils/styles.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
      Provider.of<TrendingProvider>(context, listen: false).getTrendingList();
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
                child: Text("Trending Movie", style: myTextTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),),
              ),
              SizedBox(
                height: 520,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: TrendingService().getListTrending(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.grey[300]),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${snapshot.data![index].posterPath}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("Error"),
                      );
                    }
                  },
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(color: secondaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
