import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/utilities/constants.dart';
import 'package:movie_app/utilities/custom_theme.dart';
import 'package:movie_app/views/home_page.dart';
import 'package:movie_app/views/intro_page.dart';
import 'package:movie_app/views/movie_details_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Constants.primaryColor,
        systemNavigationBarColor: Constants.primaryColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      theme: CustomTheme.lightMode,
      routes: {
        IntroPage.id: (_) => const IntroPage(),
        HomePage.id: (_) => const HomePage(),
        // MovieDetailsPage.id: (_) => const MovieDetailsPage(),
      },
      // initialRoute: IntroPage.id,
      home: const HomePage(),
    );
  }
}
