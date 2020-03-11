// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$moviesAtom = Atom(name: '_MovieControllerBase.movies');

  @override
  Movies get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(Movies value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$movieAtom = Atom(name: '_MovieControllerBase.movie');

  @override
  Movie get movie {
    _$movieAtom.context.enforceReadPolicy(_$movieAtom);
    _$movieAtom.reportObserved();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.context.conditionallyRunInAction(() {
      super.movie = value;
      _$movieAtom.reportChanged();
    }, _$movieAtom, name: '${_$movieAtom.name}_set');
  }

  final _$fetchMoviesAsyncAction = AsyncAction('fetchMovies');

  @override
  Future fetchMovies() {
    return _$fetchMoviesAsyncAction.run(() => super.fetchMovies());
  }

  final _$_MovieControllerBaseActionController =
      ActionController(name: '_MovieControllerBase');

  @override
  dynamic setMovie(int index) {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction();
    try {
      return super.setMovie(index);
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'movies: ${movies.toString()},movie: ${movie.toString()}';
    return '{$string}';
  }
}
