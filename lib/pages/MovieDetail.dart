import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("電影資訊"),
      ),
      body: FutureBuilder<Movies>(
        future: getMovieData(widget.movieId),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return snapshot.hasData
                ? MovieDetailContent(movieDetail: snapshot.data)
                : Center(child: CircularProgressIndicator());
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
  }) : _movieDetail = movieDetail, super(key: key);

  final Movies _movieDetail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          // Navigate back to first route when tapped.
          Navigator.pop(context);
        },
        child: Text(_movieDetail.name),
      ),
    );
  }
}
