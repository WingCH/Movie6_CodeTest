import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie6_code_test/models/movies.dart';

class MovieGridItem extends StatelessWidget {
  final Movies movie;

  MovieGridItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: _MovieGridImage(
                  movie.thumbnail != null ? movie.thumbnail : '')),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5, bottom: 3, top:3),
            child: Text(movie.chiName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: _MovieLikeAndComment(
                (movie.rating != null ? movie.rating : 0) / 100,
                movie.favCount,
                movie.commentCount),
          ),
        ],
      ),
    );
  }
}

class _MovieGridImage extends StatelessWidget {
  final String url;

  _MovieGridImage(this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      alignment: Alignment.center,
      image: NetworkImage(url),
    );
  }
}

class _MovieLikeAndComment extends StatelessWidget {
  final double star;
  final int like;
  final int comment;

  const _MovieLikeAndComment(this.star,
      this.like,
      this.comment, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.star,
              color: Colors.white,
              size: 10,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Text('$star',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(253, 220, 11, 1)))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.heart,
                color: Colors.white,
                size: 10,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text('$like',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(253, 220, 11, 1)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.commentAlt,
                color: Colors.white,
                size: 10,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text('$comment',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(253, 220, 11, 1)))
            ],
          ),
        ),
      ],
    );
  }
}
