import 'network.dart';

const String base_url = 'https://api.hkmovie6.com/hkm/movies';

class Movie6API {
  //TODO: add exception
  Future<dynamic> getMovieList() async {
    String _getList = '?type=showing';
    Network network = Network('$base_url$_getList');
    var moviesData = await network.getData();
    return moviesData;
  }

  Future<dynamic> getMovieDetail(movieId) async {
    Network network = Network('$base_url/$movieId');
    var movieData = await network.getData();
    return movieData;
  }
}