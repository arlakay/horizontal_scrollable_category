import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:learnrxdart/model/category_model.dart';
import 'dart:convert' as convert;

import 'package:learnrxdart/model/movie_model.dart';

class MovieApi {
  MovieModel movieResponse;
  Category categoryResponse;

  Future<MovieModel> getMovie() async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=bdc7ad42d8bcfb5e897473475a77cfe1&language=en-US&page=1');

    var jsonResponse = convert.jsonDecode(response.body);

    print(jsonResponse);

    movieResponse = MovieModel.fromJson(jsonResponse);
    return movieResponse;
  }

  Future<Category> getCategory() async {
    var response = await http.get(
        'https://private-a8e48-hcidtest.apiary-mock.com/home');

    var jsonResponse = convert.jsonDecode(response.body);

    print(jsonResponse);

    categoryResponse = Category.fromJson(jsonResponse);
    return categoryResponse;
  }

  Future<dynamic> fetchCategoryImage(String imageUrl) async {
    return CachedNetworkImageProvider(imageUrl, scale: 0.5);
  }
}
