import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie6_code_test/models/movies.dart';

class MovieGridItem extends StatelessWidget {
  final Movies movie;

  MovieGridItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, width: 100, height: 100);
  }
}
