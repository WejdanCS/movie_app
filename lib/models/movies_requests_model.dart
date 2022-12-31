// MoviesRequests
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_app/data_models/categories_model.dart';
import 'package:movie_app/data_models/now_playin_movies_model.dart';
import 'package:movie_app/data_models/search_movies_by_category_model.dart';

import '../data_models/trending_movies_model.dart';
import '../data_models/upcoming_movies_mode.dart';

class MoviesRequestsModel {
  static Future<TrendingMoviesResponse?>? getTrendingMovies(
      {String trendingBy = "week", required String apiKey}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/${trendingBy}?api_key=${apiKey}');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return TrendingMoviesResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Can't get data from server");
      }
    } catch (err) {
      if (err is SocketException) {
        throw ("Please check the Internt connection");
      } else {
        rethrow;
      }
    }
  }

  static Future<UpcomingMoviesResponse?>? getUpcomingMovies(
      {required String apiKey}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return UpcomingMoviesResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Can't get data from server");
      }
    } catch (err) {
      if (err is SocketException) {
        throw ("Please check the Internt connection");
      } else {
        rethrow;
      }
    }
  }

  static Future<NowPlayingMoviesResponse?>? getNowPlayingMovies(
      {required String apiKey}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return NowPlayingMoviesResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Can't get data from server");
      }
    } catch (err) {
      if (err is SocketException) {
        throw ("Please check the Internt connection");
      } else {
        rethrow;
      }
    }
  }

  static Future<CategoriesMoviesResponse?>? getCategoriesMovies(
      {required String apiKey}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return CategoriesMoviesResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Can't get data from server");
      }
    } catch (err) {
      if (err is SocketException) {
        throw ("Please check the Internt connection");
      } else {
        rethrow;
      }
    }
  }

  static Future<SearchMoviesByCategoryResponse?>? getMoviesByCategory(
      {required String apiKey, required String query}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=false&query=$query');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return SearchMoviesByCategoryResponse.fromJson(
            json.decode(response.body));
      } else {
        throw ("Can't get data from server");
      }
    } catch (err) {
      if (err is SocketException) {
        throw ("Please check the Internt connection");
      } else {
        rethrow;
      }
    }
  }
}
