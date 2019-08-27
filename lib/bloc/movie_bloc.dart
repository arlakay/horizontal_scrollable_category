import 'package:learnrxdart/helpers/bloc_provider.dart';
import 'package:learnrxdart/model/category_model.dart';
import 'package:learnrxdart/model/movie_model.dart';
import 'package:learnrxdart/rest/movie_api.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  final fetcherMovie = BehaviorSubject<List<Result>>();
  Observable<List<Result>> get outFetcherMovie => fetcherMovie.stream;

  final fetcherCategory = BehaviorSubject<Category>();
  Observable<Category> get outFetcherCategory => fetcherCategory.stream;

  final movieApi = MovieApi();
  MovieModel movieResponse;
  Category categoryResponse;

  fetchMovie() async {
    movieResponse = await movieApi
        .getMovie()
        .catchError((err) => fetcherMovie.addError(err));
    fetcherMovie.sink.add(movieResponse.results);
  }

  fetchCategory() async {
    categoryResponse = await movieApi
        .getCategory()
        .catchError((err) => fetcherCategory.addError(err));
    fetcherCategory.sink.add(categoryResponse);
  }

  fetchCategoryImage(String imageUrl) async {
    dynamic imgBinary = await movieApi.fetchCategoryImage(imageUrl);
    return imgBinary;
  }

  @override
  void dispose() {
    fetcherMovie.close();
  }
}
