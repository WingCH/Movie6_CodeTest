import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MovieListRating extends StatelessWidget {
  final double rating;

  const MovieListRating(
    this.rating, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$rating',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(253, 220, 11, 1)),
            ),
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

class MovieLikeAndComment extends StatelessWidget {
  final int like;
  final int comment;

  const MovieLikeAndComment(
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

class MovieListDate extends StatelessWidget {
  final String date;
  final Color color;

  const MovieListDate(
    this.date,
    this.color, {
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
          color: color, fontSize: 12, fontWeight: FontWeight.w600),
    );
  }
}
