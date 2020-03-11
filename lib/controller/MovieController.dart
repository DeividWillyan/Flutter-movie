import 'package:mobx/mobx.dart';
import 'package:movie/model/Movie.model.dart';
import 'package:movie/model/Movies.model.dart';
import 'package:movie/repository/Movie.repository.dart';

part 'MovieController.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {

  @observable
  Movies movies;

  @observable
  Movie movie;

  @action
  fetchMovies() async {
    movies = await MovieRepository().getPopularMovies();    
  }

  @action
  setMovie(int index) {
    movie = movies.movies[index];
  }

}
