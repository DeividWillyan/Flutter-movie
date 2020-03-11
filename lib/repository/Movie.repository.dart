import 'package:movie/model/Movies.model.dart';
import 'package:movie/utils/api.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MovieRepository {
  Future<Movies> getPopularMovies() async {
    String url = ApiUtils.URL_API +
        "/movie/popular?api_key=${ApiUtils.TOKEN}&language=pt-BR";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Movies.fromJson(jsonResponse);
    } else {
      print("Falha na requisição ${response.statusCode}");
    }
  }
}
