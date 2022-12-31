import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/controllers/movies_requests_controller.dart';
import 'package:movie_app/data_models/categories_model.dart';
import 'package:movie_app/data_models/trending_movies_model.dart';
import 'package:movie_app/utilities/api_config.dart';
import 'package:movie_app/utilities/constants.dart';
import 'package:movie_app/widgets/category_page.dart';
import 'package:movie_app/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> trendingByList = ["week", "day"];
  String trendingBy = "week";
  List<Genres>? genres;
  int? genIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/popcorn.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Movies App",
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "This feature is not finished yet",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Constants.primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Constants.primaryColor,
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                        child: CategoryPage(
                      categories: trendingByList,
                      onChanged: ((value, index) {
                        setState(() {
                          trendingBy = trendingByList[index];
                        });
                      }),
                    )),

                    // Container()
                  ],
                ),
              ),
              FutureBuilder(
                  future: MoviesRequestsController.getTrendingMovies(
                      trendingBy: trendingBy, apiKey: ApiConfig.apiKey),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return snapshot.data != null &&
                              snapshot.data!.results != null &&
                              snapshot.data!.results!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: size.width,
                                height: size.height * 0.3,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.results!.length,
                                    itemBuilder: ((context, index) {
                                      return MovieCard(
                                        title: snapshot
                                            .data!.results![index].title!,
                                        voteAverage: snapshot
                                            .data!.results![index].voteAverage!,
                                        posterPath: snapshot
                                            .data!.results![index].posterPath!,
                                      );
                                    })),
                              ),
                            )
                          : Text("Error");
                    }
                  })),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Upcoming",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FutureBuilder(
                  future: MoviesRequestsController.getUpcomingMovies(
                      apiKey: ApiConfig.apiKey),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return snapshot.data != null &&
                              snapshot.data!.results != null &&
                              snapshot.data!.results!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: size.width,
                                height: size.height * 0.3,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.results!.length,
                                    itemBuilder: ((context, index) {
                                      return MovieCard(
                                        title: snapshot
                                            .data!.results![index].title!,
                                        voteAverage: snapshot
                                            .data!.results![index].voteAverage!,
                                        posterPath: snapshot
                                            .data!.results![index].posterPath!,
                                      );
                                    })),
                              ),
                            )
                          : Text("Error");
                    }
                  })),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Now Playing",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FutureBuilder(
                  future: MoviesRequestsController.getNowPlayingMovies(
                      apiKey: ApiConfig.apiKey),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return snapshot.data != null &&
                              snapshot.data!.results != null &&
                              snapshot.data!.results!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: size.width,
                                height: size.height * 0.3,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.results!.length,
                                    itemBuilder: ((context, index) {
                                      return MovieCard(
                                        title: snapshot
                                            .data!.results![index].title!,
                                        voteAverage: snapshot
                                            .data!.results![index].voteAverage!,
                                        posterPath: snapshot
                                            .data!.results![index].posterPath!,
                                      );
                                    })),
                              ),
                            )
                          : Text("Error");
                    }
                  })),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Genres",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FutureBuilder(
                  future: MoviesRequestsController.getCategoriesMovies(
                      apiKey: ApiConfig.apiKey),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      genres = snapshot.data!.genres;
                      return snapshot.data != null &&
                              snapshot.data!.genres != null &&
                              snapshot.data!.genres!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: size.height * 0.2,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: genres!.length,
                                    itemBuilder: ((context, index) {
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // indexSeleced = index;
                                                genIndex = genres![index].id;
                                                print("genIndex$genIndex");
                                              });
                                            },
                                            child: Chip(
                                              backgroundColor:
                                                  genIndex == genres![index].id
                                                      ? Constants.primaryColor
                                                      : Colors.white,
                                              side:
                                                  genIndex != genres![index].id
                                                      ? const BorderSide(
                                                          color: Constants
                                                              .primaryColor)
                                                      : null,
                                              label: Text(
                                                genres![index].name!,
                                                style: TextStyle(
                                                    color: genIndex ==
                                                            genres![index].id
                                                        ? Colors.white
                                                        : Constants
                                                            .primaryColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    })),
                              ),
                            )
                          : Text("Error");
                    }
                  })),
              SizedBox(
                height: 8,
              ),
              genIndex == null
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "${genres!.firstWhere((element) => element.id == genIndex).name!} Movies",
                              style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FutureBuilder(
                            future:
                                MoviesRequestsController.getMoviesByCategory(
                                    query: genres!
                                        .firstWhere(
                                            (element) => element.id == genIndex)
                                        .name!,
                                    apiKey: ApiConfig.apiKey),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else {
                                return snapshot.data != null &&
                                        snapshot.data!.results != null &&
                                        snapshot.data!.results!.isNotEmpty
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: size.width,
                                          height: size.height * 0.3,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: snapshot
                                                  .data!.results!.length,
                                              itemBuilder: ((context, index) {
                                                return MovieCard(
                                                  title: snapshot.data!
                                                      .results![index].title!,
                                                  voteAverage: snapshot
                                                      .data!
                                                      .results![index]
                                                      .voteAverage!,
                                                  posterPath: snapshot
                                                      .data!
                                                      .results![index]
                                                      .posterPath!,
                                                );
                                              })),
                                        ),
                                      )
                                    : Text("Error");
                              }
                            })),
                      ],
                    ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
