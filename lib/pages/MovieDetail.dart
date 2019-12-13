import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie6_code_test/api/movie6_api.dart';
import 'package:movie6_code_test/models/movies.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;

  MovieDetail(this.movieId);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Movies _movieDetail = Movies();

  Future<Movies> getMovieData(_movieId) async {
    var result = await Movie6API().getMovieDetail(_movieId);
    return movieFromJson(result);
  }

  @override
  void initState() {
    super.initState();
//    getMovieData(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("電影資訊"),
      ),
      body: FutureBuilder<Movies>(
        future: getMovieData(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return MovieDetailContent(movieDetail: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key key,
    @required Movies movieDetail,
  })  : _movieDetail = movieDetail,
        super(key: key);

  final Movies _movieDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 250,
          child: Swiper(
              outer: true,
              onTap: (index) {
                print("Swiper tap id $index");
              },
              itemBuilder: (BuildContext context, int index) {
                return  Image.network(
                  _movieDetail.screenShots[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: _movieDetail.screenShots.length,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.white, color: Colors.grey),
              )),
        ),
      ],
    );
  }
}
