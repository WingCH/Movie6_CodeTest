import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: camel_case_types
class MovieListItem extends StatelessWidget {
  final int id;

  const MovieListItem(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _MovieListImage(
            'https://storage.hkmovie6.com/prod/movie/movies_50517-2019-10-24-050523046.jpg'),
        _MovieListRating(3.9),
      ],
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
    return Column(
      children: <Widget>[
        Text(
          '$rating',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
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
    );
  }
}