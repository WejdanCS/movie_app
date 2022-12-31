import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static String id = "IntroPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/popcorn.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Movies App",
              style: TextStyle(
                color: Constants.secondaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ); // assets/images/
  }
}
