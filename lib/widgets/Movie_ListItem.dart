import 'package:flutter/material.dart';

// ignore: camel_case_types
class MovieListItem extends StatelessWidget {
  final int id;

  const MovieListItem(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _MovieListImage(
            'https://storage.hkmovie6.com/prod/movie/movies_50517-2019-10-24-050523046.jpg')
      ],
    );
  }
}

class _MovieListImage extends StatelessWidget {
  final String url;
  _MovieListImage(this.url);

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
