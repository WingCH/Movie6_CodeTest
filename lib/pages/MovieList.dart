import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie6_code_test/api/movie6_api.dart';
import 'package:movie6_code_test/models/movies.dart';
import 'package:movie6_code_test/widgets/Movie_ListItem.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  List<Movies> movieList = List<Movies>();

  void getMovieData() async {
    var result = await Movie6API().getMovieList();
    print(result);

    setState(() {
      movieList = moviesFromJson(result);
    });

  }
  @override
  void initState() {
    super.initState();
    getMovieData();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.black,
            ),
        itemCount: movieList.length,
        itemBuilder: (BuildContext _context, int i) {
          return MovieListItem(movieList[i]);
        });
  }
}
