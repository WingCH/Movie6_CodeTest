import 'package:flutter/material.dart';
import 'package:movie6_code_test/models/movies.dart';
import 'package:movie6_code_test/pages/MovieDetail.dart';

import 'Component.dart';

// ignore: camel_case_types
class MovieListItem extends StatelessWidget {
  final Movies movie;

  const MovieListItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //https://github.com/flutter/flutter/issues/17383#issuecomment-388091758
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetail(movie.id)),
        );
      },
      child: Row(
        children: <Widget>[
          _MovieListImage(movie.thumbnail != null ? movie.thumbnail : ''),
          SizedBox(
            width: 100,
            child: MovieListRating(
                (movie.rating != null ? movie.rating : 0) / 100),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //TODO: title太長會出框 overflowed
                Text(movie.chiName, style: TextStyle(color: Colors.white)),
                MovieLikeAndComment(movie.favCount, movie.commentCount),
                MovieListDate(movie.openDate)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MovieListImage extends StatelessWidget {
  final String url;

  _MovieListImage(this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70.0,
        child: Image(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(url),
        ));
  }
}