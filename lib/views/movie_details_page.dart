import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage(
      {super.key,
      required this.title,
      required this.posterPath,
      required this.rate});
  static String id = "MovieDetailsPage";
  final String title;
  final double rate;
  final String posterPath;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    print("posterPath:${widget.posterPath}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Details"),
          centerTitle: true,
          backgroundColor: Constants.primaryColor,
        ),
        body: Container(
            // width: size.width,
            // height: size.height,
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
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
                                widget.rate.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Constants.secondaryColor),
                              ),
                            ],
                          ),
                        ))),
              ]),
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Text("gg"),
                    ),
                    Text("Adam")
                  ],
                ),
              ),
            )
          ]),
        )));
  }
}
