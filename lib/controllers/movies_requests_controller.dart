import 'package:movie_app/data_models/categories_model.dart';
import 'package:movie_app/data_models/now_playin_movies_model.dart';
import 'package:movie_app/data_models/upcoming_movies_mode.dart';
import 'package:movie_app/models/movies_requests_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../data_models/search_movies_by_category_model.dart';
import '../data_models/trending_movies_model.dart';

class MoviesRequestsController extends ControllerMVC {
  factory MoviesRequestsController() {
    if (_this == null) _this = MoviesRequestsController._();
    return _this;
  }
  static MoviesRequestsController _this = MoviesRequestsController._();
  MoviesRequestsController._();
  static Future<TrendingMoviesResponse?>? getTrendingMovies(
      {String trendingBy = "week", required String apiKey}) async {
    try {
      return await MoviesRequestsModel.getTrendingMovies(
          apiKey: apiKey, trendingBy: trendingBy);
    } catch (err) {
      rethrow;
    }
  }

  static Future<UpcomingMoviesResponse?> getUpcomingMovies(
      {required String apiKey}) async {
    try {
      return await MoviesRequestsModel.getUpcomingMovies(apiKey: apiKey);
    } catch (err) {
      rethrow;
    }
  }

  static Future<NowPlayingMoviesResponse?> getNowPlayingMovies(
      {required String apiKey}) async {
    try {
      return await MoviesRequestsModel.getNowPlayingMovies(apiKey: apiKey);
    } catch (err) {
      rethrow;
    }
  }

  static Future<CategoriesMoviesResponse?> getCategoriesMovies(
      {required String apiKey}) async {
    try {
      return await MoviesRequestsModel.getCategoriesMovies(apiKey: apiKey);
    } catch (err) {
      rethrow;
    }
  }

  static Future<SearchMoviesByCategoryResponse?> getMoviesByCategory(
      {required String apiKey, required query}) async {
    try {
      return await MoviesRequestsModel.getMoviesByCategory(
          apiKey: apiKey, query: query);
    } catch (err) {
      rethrow;
    }
  }
}
