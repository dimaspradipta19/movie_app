import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/styles.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFF6CAB),
                        Color(0xff7366FF),
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
