import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';
import 'package:movie_app/views/movie_details_page.dart';

class MovieCard extends StatefulWidget {
  final String posterPath;
  final double voteAverage;
  final String title;
  const MovieCard(
      {super.key,
      required this.title,
      required this.posterPath,
      required this.voteAverage});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () async {
          print("CCCC");

          //  Navigator.of(context).pushNamed(MovieDetailsPage.id);
          await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MovieDetailsPage(
                    title: widget.title,
                    posterPath: widget.posterPath,
                    rate: widget.voteAverage),
                settings: RouteSettings(name: 'A'), // <-- change 1 give a name
                fullscreenDialog: false),
          );
        },
        child: Row(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      onError: (exception, stackTrace) {
                        Text("Error");
                      },
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${widget.posterPath}"),
                      fit: BoxFit.fill)),
              child: Stack(children: [
                Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite
                                ? Constants.primaryColor
                                : Constants.thirdColor,
                            size: 20,
                          )),
                    )),
                Positioned(
                    top: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(0.9),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Constants.secondaryColor,
                              ),
                              Text(
                                widget.voteAverage.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Constants.secondaryColor),
                              ),
                            ],
                          ),
                        ))),
                Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 200,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Constants.primaryColor.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ))
              ]),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
