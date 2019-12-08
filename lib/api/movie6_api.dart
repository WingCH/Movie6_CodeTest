import 'network.dart';

const String base_url = 'https://api.hkmovie6.com/hkm/movies';
const String getList = '?type=showing';

class Movie6API{
  //TODO: 中文會亂碼
  Future<dynamic> getMovieList() async {
    Network network = Network('$base_url$getList');
    var movieData = await network.getData();
    return movieData;
  }
}