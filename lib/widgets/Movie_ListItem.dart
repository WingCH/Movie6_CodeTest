import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:movie6_code_test/models/movies.dart';

// ignore: camel_case_types
class MovieListItem extends StatelessWidget {
  final Movies movie;

  const MovieListItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.black,
      child: Row(
        children: <Widget>[
          _MovieListImage(movie.thumbnail  != null ? movie.thumbnail : ''),
          SizedBox(
            width: 100,
            child: _MovieListRating(
                (movie.rating != null ? movie.rating : 0) / 100),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //TODO: title太長會出框 overflowed
                Text(movie.name, style: TextStyle(color: Colors.white)),
                _MovieLikeAndComment(movie.favCount, movie.commentCount),
                _MovieListDate(movie.openDate)
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

class _MovieListRating extends StatelessWidget {
  final double rating;

  const _MovieListRating(
    this.rating, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            '$rating',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(253, 220, 11, 1)),
          ),
          RatingBar(
            itemSize: 50 / 5,
            initialRating: rating,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (double value) {},
          )
        ],
      ),
    );
  }
}

class _MovieLikeAndComment extends StatelessWidget {
  final int like;
  final int comment;

  const _MovieLikeAndComment(
    this.like,
    this.comment, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.heart,
                color: Colors.white,
                size: 15,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text('$like',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(253, 220, 11, 1)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.commentAlt,
                color: Colors.white,
                size: 15,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text('$comment',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(253, 220, 11, 1)))
            ],
          ),
        ),
      ],
    );
  }
}

class _MovieListDate extends StatelessWidget {
  final String date;

  const _MovieListDate(
    this.date, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/a/25256121/5588637
    DateFormat format = new DateFormat("EEE dd MMM yyyy hh:mm:ss");

    var displayDate = DateFormat("yyyy年M月dd日").format(format.parse(date));

    return Text(
      '$displayDate',
      style: TextStyle(
          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
    );
  }
}
