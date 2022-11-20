import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/account_screen.dart';
import 'package:flutter_movie_app/ui/category_screen.dart';
import 'package:flutter_movie_app/ui/favorite_screen.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            // icon: Icon(Icons.category_outlined),
            icon: FaIcon(FontAwesomeIcons.appStore),
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
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              // PROFILE BAR
              Row(
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
              const SizedBox(height: 24.0),
              // SEARCH BAR
              Row(
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
                            controller: searchController,
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
                      onPressed: () {},
                      icon: const Icon(Icons.adjust_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              // MAIN CONTENT
              Expanded(
                child: ListView.builder(
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    return const Text("Main Content");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
