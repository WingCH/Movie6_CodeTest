import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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